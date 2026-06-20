local function gh(repo) return 'https://github.com/' .. repo end

-- Useful plugin to show you pending keybinds.
-- vim.pack.add { gh 'folke/which-key.nvim' }
-- require('which-key').setup {
--   preset = 'helix',
--   -- Delay between pressing a key and opening which-key (milliseconds)
--   delay = 0,
--   icons = { mappings = vim.g.have_nerd_font },
--   -- Document existing key chains
--   spec = {
--     { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
--     { '<leader>t', group = '[T]oggle' },
--     { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
--     { 'gr', group = 'LSP Actions', mode = { 'n' } },
--     { '<leader><tab>', group = 'Tabs', mode = { 'n', 'x' } },
--   },
-- }

-- vim: ts=2 sts=2 sw=2 et

-- 1. Add the package to your runtimepath
vim.pack.add { gh "folke/which-key.nvim" }

local wk = require("which-key")

-- 2. Initialize the plugin (equivalent to the `opts` table and `config` function)
wk.setup({
    preset = "helix",
    icons = { mappings = vim.g.have_nerd_font },
    spec = {
        {
            mode = { "n", "x" },
            { "<leader><tab>", group = "tabs" },
            { "<leader>c", group = "code" },
            { "<leader>d", group = "debug" },
            { "<leader>dp", group = "profiler" },
            { "<leader>f", group = "file/find" },
            { "<leader>g", group = "git" },
            { "<leader>gh", group = "hunks" },
            { "<leader>q", group = "quit/session" },
            { "<leader>s", group = "search" },
            { "<leader>u", group = "ui" },
            { "<leader>x", group = "diagnostics/quickfix" },
            { "[", group = "prev" },
            { "]", group = "next" },
            { "g", group = "goto" },
            { "gs", group = "surround" },
            { "z", group = "fold" },
            {
                "<leader>b",
                group = "buffer",
                expand = function()
                    return require("which-key.extras").expand.buf()
                end,
            },
            {
                "<leader>w",
                group = "windows",
                proxy = "<c-w>",
                expand = function()
                    return require("which-key.extras").expand.win()
                end,
            },
            -- better descriptions
            { "gx", desc = "Open with system app" },
        },
    },
})

-- 3. Define standard keymaps (equivalent to the `keys` array)
-- Lazy.nvim defaults to normal mode ("n") when unspecified
-- Buffer
-- Show the active buffer-local keymap tree without leaving the current context.
vim.keymap.set("n", "<leader>?", function()
    wk.show({ global = false })
end, { desc = "Buffer Keymaps (which-key)" })

-- Windows
-- Keep the `<C-w>` hydra open so window commands can be chained quickly.
vim.keymap.set("n", "<c-w><space>", function()
    wk.show({ keys = "<c-w>", loop = true })
end, { desc = "Window Hydra Mode (which-key)" })

-- 4. Add icon metadata for mappings defined with `vim.keymap.set()`.
-- LazyVim gets many of these automatically from plugin key specs, but in this
-- config we define most mappings directly, so which-key needs explicit hints.
wk.add({
    { "<leader>1", icon = { icon = "󰛢 ", color = "cyan" } },
    { "<leader>2", icon = { icon = "󰛢 ", color = "cyan" } },
    { "<leader>3", icon = { icon = "󰛢 ", color = "cyan" } },
    { "<leader>4", icon = { icon = "󰛢 ", color = "cyan" } },
    { "<leader>h", icon = { icon = "󰛢 ", color = "cyan" } },
    { "<leader>e", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader>E", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader><space>", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader>,", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader>/", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader>:", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader>.", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader>S", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader>n", icon = { icon = "󱥰 ", color = "purple" } },
    { "<leader>_", icon = { icon = "󰆴 ", color = "purple" } },
    { "<leader>cf", icon = { icon = " ", color = "orange" } },
    { "<leader>qs", icon = { icon = " ", color = "azure" } },
    { "<leader>qS", icon = { icon = " ", color = "azure" } },
    { "<leader>ql", icon = { icon = " ", color = "azure" } },
    { "<leader>qd", icon = { icon = " ", color = "azure" } },
    { "<leader>db", icon = { icon = "󰃤 ", color = "red" } },
    { "<leader>dB", icon = { icon = "󰃤 ", color = "red" } },
    { "<leader>sr", icon = { icon = "󰛔 ", color = "blue" } },
}, { mode = "n" })
