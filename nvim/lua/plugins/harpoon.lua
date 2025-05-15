local harpoon_extensions = require("harpoon.extensions")

-- Extension to highlight the current file, if it is opened
require("harpoon"):extend(harpoon_extensions.builtins.highlight_current_file())

-- Set keys to open harpooned files in split or new tab
require("harpoon"):extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      require("harpoon").ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-x>", function()
      require("harpoon").ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      require("harpoon").ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr })
  end,
})

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>h",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon File",
    },
    {
      "<C-e>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Quick Menu",
    },
  },
}
