local uv = vim.uv or vim.loop

local M = setmetatable({}, {
  __call = function(mod, ...)
    return mod.get(...)
  end,
})

-- Old repo-root-only behavior:
-- M.spec = { { ".git" }, "cwd" }
--
-- Current behavior:
-- 1. Prefer the active LSP workspace when one is attached.
-- 2. Fall back to local project markers so nested configs like `dotfiles/nvim`
--    stay scoped to their own directory instead of the parent repository root.
-- 3. Fall back to Neovim's current working directory.
M.spec = { "lsp", { ".git", "lua" }, "cwd" }

M.cache = {}
M.detectors = {}

function M.detectors.cwd()
  return { uv.cwd() }
end

function M.realpath(path)
  if path == "" or path == nil then
    return nil
  end

  path = vim.fn.has("win32") == 0 and uv.fs_realpath(path) or path
  return path and vim.fs.normalize(path) or nil
end

function M.bufpath(buf)
  return M.realpath(vim.api.nvim_buf_get_name(assert(buf)))
end

function M.detectors.lsp(buf)
  local bufpath = M.bufpath(buf)
  if not bufpath then
    return {}
  end

  local roots = {}
  local clients = vim.lsp.get_clients({ bufnr = buf })
  clients = vim.tbl_filter(function(client)
    return not vim.tbl_contains(vim.g.root_lsp_ignore or {}, client.name)
  end, clients)

  for _, client in pairs(clients) do
    for _, workspace in pairs(client.config.workspace_folders or {}) do
      roots[#roots + 1] = vim.uri_to_fname(workspace.uri)
    end
    if client.root_dir then
      roots[#roots + 1] = client.root_dir
    end
  end

  return vim.tbl_filter(function(path)
    path = M.realpath(path)
    return path and bufpath:find(path, 1, true) == 1
  end, roots)
end

function M.detectors.pattern(buf, patterns)
  patterns = type(patterns) == "string" and { patterns } or patterns

  local path = M.bufpath(buf) or uv.cwd()
  local marker = vim.fs.find(function(name)
    for _, pattern in ipairs(patterns) do
      if name == pattern then
        return true
      end
      if pattern:sub(1, 1) == "*" and name:find(vim.pesc(pattern:sub(2)) .. "$") then
        return true
      end
    end
    return false
  end, { path = path, upward = true })[1]

  return marker and { vim.fs.dirname(marker) } or {}
end

function M.resolve(spec)
  if M.detectors[spec] then
    return M.detectors[spec]
  elseif type(spec) == "function" then
    return spec
  end

  return function(buf)
    return M.detectors.pattern(buf, spec)
  end
end

function M.detect(opts)
  opts = opts or {}
  opts.spec = opts.spec or type(vim.g.root_spec) == "table" and vim.g.root_spec or M.spec
  opts.buf = (opts.buf == nil or opts.buf == 0) and vim.api.nvim_get_current_buf() or opts.buf

  local ret = {}
  for _, spec in ipairs(opts.spec) do
    local paths = M.resolve(spec)(opts.buf)
    paths = paths or {}
    paths = type(paths) == "table" and paths or { paths }

    local roots = {}
    for _, path in ipairs(paths) do
      local normalized = M.realpath(path)
      if normalized and not vim.tbl_contains(roots, normalized) then
        roots[#roots + 1] = normalized
      end
    end

    table.sort(roots, function(a, b)
      return #a > #b
    end)

    if #roots > 0 then
      ret[#ret + 1] = { spec = spec, paths = roots }
      if opts.all == false then
        break
      end
    end
  end

  return ret
end

function M.get(opts)
  opts = opts or {}
  local buf = opts.buf or vim.api.nvim_get_current_buf()
  local ret = M.cache[buf]

  if not ret then
    local roots = M.detect({ all = false, buf = buf })
    ret = roots[1] and roots[1].paths[1] or uv.cwd()
    M.cache[buf] = ret
  end

  if opts.normalize then
    return ret
  end
  return vim.fn.has("win32") == 1 and ret:gsub("/", "\\") or ret
end

function M.git(opts)
  local root = M.get(vim.tbl_extend("force", opts or {}, { normalize = true }))
  local git_root = vim.fs.find(".git", { path = root, upward = true })[1]
  return git_root and vim.fs.dirname(git_root) or root
end

function M.setup()
  if M._did_setup then
    return
  end
  M._did_setup = true

  vim.api.nvim_create_autocmd({ "LspAttach", "BufWritePost", "DirChanged", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("azeveco_workspace_cache", { clear = true }),
    callback = function(event)
      if event.event == "DirChanged" then
        M.cache = {}
      else
        M.cache[event.buf] = nil
      end
    end,
  })
end

return M
