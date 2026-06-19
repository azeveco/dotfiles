vim.pack.add { "https://github.com/tpope/vim-fugitive" }

-- Define keymaps to be only used when a fugifive buffer (FileType) is opened
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("azeveco-fugitive", { clear = true }),
  pattern = "fugitive",
  callback = function(event)
    vim.keymap.set("n", "<leader>gt", function()
      vim.cmd("G difftool -y")
    end, { buffer = event.buf, desc = "Git Difftool" })
  end,
})
