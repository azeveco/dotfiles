local function gh(repo) return 'https://github.com/' .. repo end

-- 1. Add the package to your runtimepath
vim.pack.add { gh "MagicDuck/grug-far.nvim" }

-- 2. Initialize the plugin (equivalent to the `opts` table)
require("grug-far").setup({
  headerMaxWidth = 80
})

-- Search
-- Open Grug Far prefilled for the current filetype so replacements stay scoped.
vim.keymap.set({ "n", "x" }, "<leader>sr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Search and Replace" })
