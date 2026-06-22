vim.pack.add {
  {
    src = "https://github.com/obsidian-nvim/obsidian.nvim",
    version = vim.version.range "*", -- use latest release, remove to use latest commit
  },
}

require("obsidian").setup {
  legacy_commands = false, -- this will be removed in 4.0.0
  workspaces = {
    {
      name = "The Hivemind",
      path = "~/Documents/The Hivemind/",
    },
  },
  picker = {
    name = "snacks.picker",
  }
}

vim.keymap.set("n", "<leader>ob", ":Obsidian backlinks<CR>", { desc = "Obsidian backlinks" })
vim.keymap.set("n", "<leader>od", ":Obsidian today<CR>", { desc = "Obsidian daily note" })
vim.keymap.set("n", "<leader>ol", ":Obsidian links<CR>", { desc = "Obsidian note links" })
vim.keymap.set("n", "<leader>oo", ":Obsidian open<CR>", { desc = "Open in Obsidian" })
vim.keymap.set("n", "<leader>oq", ":Obsidian quick_switch<CR>", { desc = "Obsidian quick switch" })
vim.keymap.set("n", "<leader>os", ":Obsidian search<CR>", { desc = "Search Obsidian notes" })
vim.keymap.set("n", "<leader>ot", ":Obsidian template<CR>", { desc = "Insert Obsidian template" })
vim.keymap.set("n", "<leader>oT", ":Obsidian toc<CR>", { desc = "Obsidian table of contents" })
