local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Move Lines
keymap("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
keymap("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
keymap("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Easier access to beginning and end of lines
keymap("n", "<A-h>", "^", {
  desc = "Go to start of line",
  silent = true,
})
keymap("n", "<A-l>", "$", {
  desc = "Go to end of line",
  silent = true,
})

-- Keymap to do a search and replace
keymap({ "n", "v" }, "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Search & Replace" })

keymap("x", "<leader>p", [["_dP]])
keymap({ "n", "v" }, "<leader>d", "\"_d")

-- Keymap to run LazyDocker by using the lazydocker.nvim
-- keymap({ "n", "t" }, "<leader>fl", "<Cmd>lua LazyDocker.toggle()<CR>", { desc = "LazyDocker" })

-- Blamer
-- keymap("n", "<leader>go", ":BlamerToggle<CR>", { desc = "Blamer" })

-- Wrap selected lines with a delimiter
-- keymap("v", "<leader>o", function()
--   require("custom.wrap_selection").wrap_lines()
-- end, { desc = "Wrap lines with delimiter" })

