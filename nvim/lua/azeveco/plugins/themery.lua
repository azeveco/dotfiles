local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'zaldih/themery.nvim' }
require('themery').setup {
  themes = {
    'gruvbox',
    'kanagawa-dragon',
    'kanagawa-wave',
    'rose-pine-moon',
    'rose-pine-main',
    'ayu-dark',
    'default',
  },
}

-- vim.keymap.set('n', '<leader>uc', ':Themery<CR>', { desc = 'Colorschemes' })
-- vim: ts=2 sts=2 sw=2 et
