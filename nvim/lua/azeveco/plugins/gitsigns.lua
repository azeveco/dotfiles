local function gh(repo) return 'https://github.com/' .. repo end

-- Here is a more advanced configuration example that passes options to `gitsigns.nvim`
--
-- See `:help gitsigns` to understand what each configuration key does.
-- Adds git related signs to the gutter, as well as utilities for managing changes
vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
require('gitsigns').setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Next / Prev
    -- Jump through changed hunks while preserving the built-in diff behavior.
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git change' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git change' })

    -- Git / Hunks
    -- Stage, reset, preview, and inspect hunks from both visual and normal mode.
    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git stage hunk' })
    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git reset hunk' })
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git stage hunk' })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git reset hunk' })
    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git Stage buffer' })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git Reset buffer' })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git preview hunk' })
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'git preview hunk inline' })
    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'git blame line' })
    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git diff against index' })
    map('n', '<leader>hD', function() gitsigns.diffthis '@' end, { desc = 'git Diff against last commit' })
    map('n', '<leader>hQ', function() gitsigns.setqflist 'all' end, { desc = 'git hunk Quickfix list (all files in repo)' })
    map('n', '<leader>hq', gitsigns.setqflist, { desc = 'git hunk quickfix list (all changes in this file)' })

    -- UI
    -- Toggle blame and intra-line diff helpers when you want more git context.
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git show blame line' })
    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle git intra-line word diff' })

    -- Text Objects
    -- Treat the current hunk as a text object in operator-pending and visual mode.
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
