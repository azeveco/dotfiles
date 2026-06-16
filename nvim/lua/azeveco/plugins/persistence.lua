local function gh(repo) return 'https://github.com/' .. repo end
-- Session management. This saves your session in the background,
-- keeping track of open buffers, window arrangement, and more.
-- You can restore sessions when returning through the dashboard.

-- 1. Install and load the plugin natively
vim.pack.add { gh "folke/persistence.nvim" }

-- 2. Initialize the plugin (equivalent to `opts = {}`)
require("persistence").setup({})

-- Quit / Session
-- Restore, pick, or stop saving sessions from the `<leader>q` namespace.

vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore Session" })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select Session" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't Save Current Session" })
