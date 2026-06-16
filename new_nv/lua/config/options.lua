-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showtabline = 1

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Improves copy and paste between Windows and WSL
vim.opt.clipboard = "unnamedplus"

-- Enable undo/redo changes even after closing and reopening a file
vim.o.undofile = true

-- Show ghost text when using copilot.lua
-- AI completion (not ghost text)
-- vim.g.ai_cmp = true -- true to show AI on cmp suggestions and not ghost text

-- Disable vim-tmux-navigator while zoomed in tmux pane
vim.g.tmux_navigator_disable_when_zoomed = 1

-- vim-tmux-navigator: preserve zoom while navigating between tmux and vim
-- vim.g.tmux_navigator_preserve_zoom = 1

-- Blamer settings
-- vim.g["blamer_enabled"] = 0
-- vim.g["blamer_show_in_visual_modes"] = 1
-- vim.g["blamer_show_in_insert_modes"] = 0
-- vim.g["blamer_delay"] = 500
-- vim.g["blamer_template"] = "|<commit-short>| <author>, <committer-time> • <summary>"

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- enable break indent
vim.o.breakindent = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
