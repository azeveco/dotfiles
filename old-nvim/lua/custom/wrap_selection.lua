local M = {}

function M.wrap_lines()
  vim.ui.input({ prompt = "Delimiter (ex: \", ', (, [, {): " }, function(input)
    if not input or input == "" then
      return
    end

    local start_delim = input
    local end_delim = ({
      ['"'] = '"',
      ["'"] = "'",
      ["("] = ")",
      ["["] = "]",
      ["{"] = "}",
    })[input] or input

    -- pega as linhas da seleção visual
    local start_pos = vim.fn.line("'<")
    local end_pos = vim.fn.line("'>")

    for i = start_pos, end_pos do
      local line = vim.fn.getline(i)
      line = string.format("%s%s%s,", start_delim, line, end_delim)
      vim.fn.setline(i, line)
    end
  end)
end

return M
