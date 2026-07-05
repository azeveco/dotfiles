local function gh(repo) return 'https://github.com/' .. repo end

-- iamcco/markdown-preview.nvim
-- This plugin opens a browser tab with a live preview of your markdown file.
-- Note: The build step (yarn install) is configured in lua/pack.lua

vim.pack.add { gh 'iamcco/markdown-preview.nvim' }

-- We only want to set the keymap for markdown files to avoid cluttering
-- the global keymaps.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(event)
    vim.keymap.set(
      "n",
      "<leader>cp",
      ":MarkdownPreviewToggle<cr>",
      { buffer = event.buf, desc = "Markdown Preview" }
    )
  end,
})

-- vim: ts=2 sts=2 sw=2 et
