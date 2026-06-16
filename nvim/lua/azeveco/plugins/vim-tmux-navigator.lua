local function gh(repo) return 'https://github.com/' .. repo end

-- 1. Add the package to your runtimepath
vim.pack.add { gh "christoomey/vim-tmux-navigator" }

-- Windows
-- Navigate seamlessly between Neovim splits and tmux panes with the same keys.
vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")
