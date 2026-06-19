local function gh(repo) return 'https://github.com/' .. repo end
local workspace = require 'azeveco.workspace'

-- Setup workspace
workspace.setup()

-- 1. Load the plugin natively
vim.pack.add{ gh "folke/snacks.nvim" }

-- 2. Initialize the plugin with your merged configuration
require("snacks").setup({
    bigfile = { enabled = true },
    -- netrw is disabled in options.lua, so let Snacks handle `nvim <dir>`.
    explorer = { enabled = true, replace_netrw = false },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
        enabled = true,
        timeout = 3000,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
        notification = {}
    },

    -- Merged Scroll Settings
    scroll = { enabled = false }, -- Disabled scrolling animations

    -- Merged Dashboard Settings
    dashboard = {
        enabled = true,
        preset = {
   --        header = [[
   --                                                                     
   --       ████ ██████           █████      ██                     
   --      ███████████             █████                             
   --      █████████ ███████████████████ ███   ███████████   
   --     █████████  ███    █████████████ █████ ██████████████   
   --    █████████ ██████████ █████████ █████ █████ ████ █████   
   --  ███████████ ███    ███ █████████ █████ █████ ████ █████  
   -- ██████  █████████████████████ ████ █████ █████ ████ ██████ 
   --            ]],
        header = [[
                                                                   
      ████ ██████           █████      ██                 btw
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
        },
        sections = {
            { section = "header" },
            -- { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
            { section = "keys", indent = 2, padding = 1, gap = 1 },
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        },
    },

    picker = {
        enabled = true,
        layout = {
            preset = "telescope",
        },
        formatters = {
            file = {
                truncate = 60,
            },
        },
        matcher = {
            smartcase = false, -- Allow search to be case-insensitive
        },
        toggles = {
            ruby_only = "💎",
            hide_tests = "🚫",
        },
        actions = {
            toggle_ruby = function(picker)
                if picker.opts.args and vim.tbl_contains(picker.opts.args, "ruby") then
                    picker.opts.args = {} -- Clear args (search all files)
                    picker.opts["ruby_only"] = false
                    require("snacks").notify.info("Grep: All Files")
                else
                    picker.opts.args = { "-t", "ruby" } -- Force Ruby type
                    picker.opts["ruby_only"] = true
                    require("snacks").notify.info("Grep: Ruby Only")
                end
                picker:find()
            end,
            hide_tests = function(picker)
                if picker.opts.args and vim.tbl_contains(picker.opts.args, "!*_test.rb*") then
                    picker.opts.args = {} -- Clear args (Include tests again)
                    picker.opts["hide_tests"] = false
                    require("snacks").notify.info("Grep: Including Tests")
                else
                    picker.opts.args = { "-g", "!*_test.rb*" } -- Force exclude glob
                    picker.opts["hide_tests"] = true
                    require("snacks").notify.info("Grep: Excluding Tests")
                end
                picker:find()
            end,
        },
        sources = {
            explorer = {
                layout = {
                    auto_hide = { "input" }, -- Auto hide the Explorer search input/bar
                },
                win = {
                    list = {
                        keys = {
                            ["<Esc>"] = { "cancel", mode = { "n", "i" } },
                            ["<C-o>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                            ["<S-Y>"] = "copy_file_path",
                        },
                    },
                },
                actions = {
                    copy_file_path = {
                        action = function(_, item)
                            if not item then
                                return
                            end
                            local result = vim.fn.fnamemodify(item.file, ":.")
                            if result then
                                vim.fn.setreg("+", result)
                                require("snacks").notify.info("Yanked `" .. result .. "`")
                            end
                        end,
                    },
                },
            },
        },
        win = {
            input = {
                keys = {
                    ["<Esc>"] = { "cancel", mode = { "n", "i" } },
                    ["<C-o>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                    ["<C-e>"] = { "edit_vsplit", mode = { "i", "n" } },
                    ["<a-t>"] = { "toggle_ruby", mode = { "i", "n" } },
                    ["<a-n>"] = { "hide_tests", mode = { "i", "n" } },
                },
            },
            list = {
                keys = {
                    ["<Esc>"] = { "cancel", mode = { "n", "i" } },
                    ["<C-o>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                    ["<C-e>"] = "edit_vsplit",
                },
            },
        },
    },
})

-- 3. Debug Globals & Toggles
_G.dd = function(...)
    require("snacks").debug.inspect(...)
end
_G.bt = function()
    require("snacks").debug.backtrace()
end

-- Override print to use snacks for `:=` command
if vim.fn.has("nvim-0.11") == 1 then
    vim._print = function(_, ...)
        dd(...)
    end
else
    vim.print = _G.dd 
end

-- UI
-- These toggles control editor presentation and display-oriented helpers.
require("snacks").toggle.option("spell", { name = "Spelling" }):map("<leader>us")
require("snacks").toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
require("snacks").toggle.diagnostics():map("<leader>ud")
require("snacks").toggle.line_number():map("<leader>ul")
require("snacks").toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
require("snacks").toggle.treesitter():map("<leader>uT")
require("snacks").toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
require("snacks").toggle.inlay_hints():map("<leader>uh")
require("snacks").toggle.indent():map("<leader>ug")
require("snacks").toggle.dim():map("<leader>uD")

-- File / Find
-- These are the main entry points for exploring files, buffers, and project roots.
vim.keymap.set("n", "<leader><space>", function() require("snacks").picker.files({ cwd = workspace() }) end, { desc = "Find Files (Root Dir)" })
vim.keymap.set("n", "<leader>,", function() require("snacks").picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function() require("snacks").picker.grep({ cwd = workspace() }) end, { desc = "Grep (Root Dir)" })
vim.keymap.set("n", "<leader>:", function() require("snacks").picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>e", function() require("snacks").explorer({ cwd = workspace() }) end, { desc = "Explorer Snacks (root dir)" })
vim.keymap.set("n", "<leader>E", function() require("snacks").explorer() end, { desc = "Explorer Snacks (cwd)" })

-- File / Find
-- Dedicated `<leader>f` mappings keep file discovery and project switching together.
vim.keymap.set("n", "<leader>fb", function() require("snacks").picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fB", function() require("snacks").picker.buffers({ hidden = true, nofile = true }) end, { desc = "Buffers (all)" })
vim.keymap.set("n", "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function() require("snacks").picker.files({ cwd = workspace() }) end, { desc = "Find Files (Root Dir)" })
vim.keymap.set("n", "<leader>fF", function() require("snacks").picker.files({ cwd = vim.fn.getcwd() }) end, { desc = "Find Files (cwd)" })
vim.keymap.set("n", "<leader>fg", function() require("snacks").picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", function() require("snacks").picker.projects() end, { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function() require("snacks").picker.recent({ cwd = workspace() }) end, { desc = "Recent" })
vim.keymap.set("n", "<leader>fR", function() require("snacks").picker.recent({ filter = { cwd = true } }) end, { desc = "Recent (cwd)" })
vim.keymap.set("n", "<leader>fe", function() require("snacks").explorer({ cwd = workspace() }) end, { desc = "Explorer Snacks (root dir)" })
vim.keymap.set("n", "<leader>fE", function() require("snacks").explorer() end, { desc = "Explorer Snacks (cwd)" })
vim.keymap.set("n", "<leader>fs", function() require("snacks").picker.smart() end, { desc = "Smart Find Files" })

-- Git
-- Git pickers and browser actions live together so history, status, and sharing are grouped.
vim.keymap.set("n", "<leader>gb", function() require("snacks").picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function() require("snacks").picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function() require("snacks").picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function() require("snacks").picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function() require("snacks").picker.git_stash() end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function() require("snacks").picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gD", function() require("snacks").picker.git_diff({ base = "origin", group = true }) end, { desc = "Git Diff (origin)" })
vim.keymap.set("n", "<leader>gf", function() require("snacks").picker.git_log_file() end, { desc = "Git Log File" })
vim.keymap.set({ "n", "v" }, "<leader>gB", function() require("snacks").gitbrowse() end, { desc = "Git Browse (open)" })
vim.keymap.set({ "n", "x" }, "<leader>gY", function()
  require("snacks").gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })
vim.keymap.set("n", "<leader>gv", ":G<CR>", { desc = "Git" })

-- Search
-- Search helpers cover text, commands, diagnostics, and navigation history.
vim.keymap.set("n", "<leader>sB", function() require("snacks").picker.grep_buffers() end, { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>sg", function() require("snacks").picker.grep({ cwd = workspace() }) end, { desc = "Grep (Root Dir)" })
vim.keymap.set("n", "<leader>sG", function() require("snacks").picker.grep({ cwd = vim.fn.getcwd() }) end, { desc = "Grep (cwd)" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function() require("snacks").picker.grep_word({ cwd = workspace() }) end, { desc = "Visual selection or word (Root Dir)" })
vim.keymap.set({ "n", "x" }, "<leader>sW", function() require("snacks").picker.grep_word({ cwd = vim.fn.getcwd() }) end, { desc = "Visual selection or word (cwd)" })
vim.keymap.set("n", '<leader>s"', function() require("snacks").picker.registers() end, { desc = "Registers" })
vim.keymap.set("n", '<leader>s/', function() require("snacks").picker.search_history() end, { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function() require("snacks").picker.autocmds() end, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sb", function() require("snacks").picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sc", function() require("snacks").picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() require("snacks").picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function() require("snacks").picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", function() require("snacks").picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function() require("snacks").picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() require("snacks").picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function() require("snacks").picker.icons() end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function() require("snacks").picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() require("snacks").picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() require("snacks").picker.loclist() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function() require("snacks").picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function() require("snacks").picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sp", function() require("snacks").picker.lazy() end, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", function() require("snacks").picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>sR", function() require("snacks").picker.resume() end, { desc = "Resume" })
vim.keymap.set("n", "<leader>su", function() require("snacks").picker.undo() end, { desc = "Undo History" })

-- Goto
-- LSP-backed symbol navigation stays under the `g` and search-style symbol mappings.
vim.keymap.set("n", "gr", function() require("snacks").picker.lsp_references() end, { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", function() require("snacks").picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function() require("snacks").picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "gai", function() require("snacks").picker.lsp_incoming_calls() end, { desc = "Calls Incoming" })
vim.keymap.set("n", "gao", function() require("snacks").picker.lsp_outgoing_calls() end, { desc = "Calls Outgoing" })
vim.keymap.set("n", "<leader>ss", function() require("snacks").picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", function() require("snacks").picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

-- Buffer
-- Scratch buffers and buffer deletion helpers are grouped with buffer-oriented actions.
vim.keymap.set("n", "<leader>.", function() require("snacks").scratch() end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>S", function() require("snacks").scratch.select() end, { desc = "Select Scratch Buffer" })

-- Code
-- File renames are code-aware operations, so they live under the code namespace.
vim.keymap.set("n", "<leader>cR", function() require("snacks").rename.rename_file() end, { desc = "Rename File" })

-- UI
-- UI helpers cover zen mode, notifications, colorschemes, and terminal access.
vim.keymap.set("n", "<leader>uz", function() require("snacks").zen() end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>uZ", function() require("snacks").zen.zoom() end, { desc = "Toggle Zoom" })
vim.keymap.set("n", "<leader>uC", function() require("snacks").picker.colorschemes() end, { desc = "Colorschemes" })
vim.keymap.set("n", "<leader>n", function() require("snacks").picker.notifications() end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>un", function() require("snacks").notifier.hide() end, { desc = "Dismiss All Notifications" })
vim.keymap.set("n", "<c-/>", function() require("snacks").terminal() end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<c-_>", function() require("snacks").terminal() end, { desc = "which_key_ignore" })

-- Next / Prev
-- Jump between repeated references surfaced by Snacks words.
vim.keymap.set({ "n", "t" }, "]]", function() require("snacks").words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function() require("snacks").words.jump(-vim.v.count1) end, { desc = "Prev Reference" })

-- Git
-- Lazygit mappings stay with the rest of the git workflow helpers.
if vim.fn.executable("lazygit") == 1 then
  vim.keymap.set("n", "<leader>gg", function()
    -- Natively find the git root, fallback to current working directory if not found
    require("snacks").lazygit({ cwd = workspace.git() })
  end, { desc = "Lazygit (Root Dir)" })

  vim.keymap.set("n", "<leader>gG", function()
    require("snacks").lazygit()
  end, { desc = "Lazygit (cwd)" })
end
