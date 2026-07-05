local function gh(repo) return 'https://github.com/' .. repo end

-- MeanderingProgrammer/render-markdown.nvim
-- This plugin renders markdown files inside Neovim by replacing markdown syntax
-- with nice formatting (like headings, checkboxes, and tables).
-- It also automatically handles setting conceallevel=2 exclusively for markdown files!

vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup({
  heading = {
    -- Override default numbered circle icons with standard markdown hashtags
    icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
  },
})

-- vim: ts=2 sts=2 sw=2 et
