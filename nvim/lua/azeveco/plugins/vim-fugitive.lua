vim.pack.add { "https://github.com/tpope/vim-fugitive" }

-- Extract the target file path from a fugitive status entry line.
local function fugitive_file_from_line(line)
  if vim.trim(line) == "" then
    return nil
  end

  local file = line:match("^%s*[MADRCU%?!][ MADRCU%?!]?%s+(.+)$")
  if file == nil then
    return nil
  end

  file = vim.trim(file)

  local renamed_file = file:match("^.- %-%> (.+)$")
  if renamed_file ~= nil then
    return renamed_file
  end

  return file
end

-- Identify whether a header line represents the staged or unstaged section.
local function fugitive_section_name(line)
  if line:match("^%s*Staged %(%d+%)%s*$") then
    return "staged"
  end

  if line:match("^%s*Unstaged %(%d+%)%s*$") then
    return "unstaged"
  end

  return nil
end

-- Walk upward from the current line to find which section the entry belongs to.
local function fugitive_section_for_line(bufnr, line_nr)
  for current = line_nr, 1, -1 do
    local line = vim.api.nvim_buf_get_lines(bufnr, current - 1, current, false)[1]
    local section = line and fugitive_section_name(line) or nil

    if section ~= nil then
      return section
    end
  end

  return nil
end

-- Collect every file entry that appears under a staged/unstaged section header.
local function fugitive_section_files(bufnr, start_line)
  local line_count = vim.api.nvim_buf_line_count(bufnr)
  local files = {}

  for line_nr = start_line + 1, line_count do
    local line = vim.api.nvim_buf_get_lines(bufnr, line_nr - 1, line_nr, false)[1]

    if line == nil or vim.trim(line) == "" then
      break
    end

    local file = fugitive_file_from_line(line)
    if file == nil then
      break
    end

    table.insert(files, file)
  end

  return files
end

-- Run fugitive difftool for one or more files, using --cached for staged entries.
local function fugitive_difftool(files, section)
  local escaped_files = vim.tbl_map(vim.fn.fnameescape, files)
  local args = { "G", "difftool", "-y" }

  if section == "staged" then
    table.insert(args, "--cached")
  end

  table.insert(args, "--")

  for _, file in ipairs(escaped_files) do
    table.insert(args, file)
  end

  vim.cmd(table.concat(args, " "))
end

-- Define keymaps to be only used when a fugifive buffer (FileType) is opened
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("azeveco-fugitive", { clear = true }),
  pattern = "fugitive",
  callback = function(event)
    vim.keymap.set("n", "<leader>gt", function()
      local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
      local line = vim.api.nvim_get_current_line()
      local file = fugitive_file_from_line(line)
      local section = fugitive_section_name(line)

      if file ~= nil and file ~= "" then
        section = fugitive_section_for_line(event.buf, cursor_line)

        if section == nil then
          vim.notify("Could not determine file section", vim.log.levels.ERROR)
          return
        end

        fugitive_difftool({ file }, section)
        return
      end

      if section ~= nil then
        local files = fugitive_section_files(event.buf, cursor_line)

        if vim.tbl_isempty(files) then
          vim.notify("Current section has no file entries", vim.log.levels.ERROR)
          return
        end

        fugitive_difftool(files, section)
        return
      end

      vim.notify("Current line is not a file entry", vim.log.levels.ERROR)
    end, { buffer = event.buf, desc = "Git Difftool" })
  end,
})
