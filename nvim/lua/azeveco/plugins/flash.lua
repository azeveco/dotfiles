local function gh(repo) return 'https://github.com/' .. repo end

-- Flash enhances the built-in search functionality by showing labels
-- at the end of each match, letting you quickly jump to a specific
-- location.

-- 1. Install and load the plugin natively
vim.pack.add { gh "folke/flash.nvim" }

require("flash").setup({})

-- Goto
-- Flash turns motions into label-based jumps for fast navigation in the visible area.
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "o", "x" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })

-- Search
-- Toggle Flash integration from the command line when you want the default search flow.
vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

-- Selection
-- This mirrors incremental selection behavior using Flash's Treesitter integration.
vim.keymap.set({ "n", "o", "x" }, "<c-space>", function()
  require("flash").treesitter({
    actions = {
      ["<c-space>"] = "next",
      ["<BS>"] = "prev"
    }
  })
end, { desc = "Treesitter Incremental Selection" })
