return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "gruvbox",
        "kanagawa-dragon",
        "kanagawa-wave",
        "rose-pine-moon",
        "rose-pine-main",
        "default"
      },
    })
  end,
  keys = {
    { "<leader>sc", ":Themery<CR>", mode = "n", desc = "Colorschemes" }
  }
}
