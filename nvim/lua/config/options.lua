-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = true
vim.opt.showtabline = 1

-- Improves copy and paste between Windows and WSL
vim.opt.clipboard = "unnamedplus"

-- Show ghost text when using copilot.lua
-- vim.g.ai_cmp = false

-- Disable vim-tmux-navigator while zoomed in tmux pane
vim.g.tmux_navigator_disable_when_zoomed = 1

-- vim-tmux-navigator: preserve zoom while navigating between tmux and vim
-- vim.g.tmux_navigator_preserve_zoom = 1

-- Blamer settings
vim.g["blamer_enabled"] = 0
vim.g["blamer_show_in_visual_modes"] = 1
vim.g["blamer_show_in_insert_modes"] = 0
vim.g["blamer_delay"] = 500
vim.g["blamer_template"] = "|<commit-short>| <author>, <committer-time> • <summary>"
