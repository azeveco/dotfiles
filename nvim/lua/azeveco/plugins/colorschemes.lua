local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add { gh 'folke/tokyonight.nvim' }
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
}

vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})
---@diagnostic disable-next-line: missing-fields
require("rose-pine").setup({})

vim.pack.add({
	{
		src = "https://github.com/rebelot/kanagawa.nvim",
		name = "kanagawa",
	},
})
---@diagnostic disable-next-line: missing-fields
require("kanagawa").setup({})

vim.pack.add({
	{
		src = "https://github.com/ellisonleao/gruvbox.nvim",
	},
})
---@diagnostic disable-next-line: missing-fields
require("gruvbox").setup({})

vim.pack.add({
  {
    src = "https://github.com/Shatur/neovim-ayu",
  },
})
---@diagnostic disable-next-line: missing-fields
require("ayu").setup({})

vim.pack.add({
  {
    src = "https://github.com/embark-theme/vim",
    name = "embark",
  },
})
vim.g.embark_terminal_italics = 1

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
-- vim.cmd.colorscheme 'kanagawa-wave'

-- vim: ts=2 sts=2 sw=2 et
