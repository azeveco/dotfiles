return {
  "folke/snacks.nvim",
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    picker = {
      layout = {
        preset = "telescope",
      },
      formatters = {
        file = {
          -- filename_first = true,
          truncate = 60,
        },
      },
      matcher = {
        smartcase = false, -- Allow search to be case-insensitive
      },
      sources = {
        explorer = {
          layout = {
            auto_hide = { "input" }, -- Auto hide the Explorer search input/bar
            -- preview = "main",
            -- preview = {
            --   main = true,
            --   enabled = false,
            -- },
          },
          win = {
            list = {
              keys = {
                ["<C-o>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
              },
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<C-o>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
            ["<C-e>"] = { "edit_vsplit", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<C-o>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
            ["<C-e>"] = "edit_vsplit",
          },
        },
      },
    },

    dashboard = {
      preset = {
        -- header = [[
        --  ██████╗  █████╗ ██████╗ ███████╗
        -- ██╔════╝ ██╔══██╗██╔══██╗██╔════╝
        -- ██║  ███╗███████║██████╔╝███████╗
        -- ██║   ██║██╔══██║██╔══██╗╚════██║
        -- ╚██████╔╝██║  ██║██████╔╝███████║
        --  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝
        --
        -- ]],

        header = [[
         ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
         ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
         ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
         ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
         ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
         ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
         Hi! You can call me Gabs :D]],
      },
      sections = {
        { section = "header" },
        -- { title = { "Hi! You can call me Gabs =D", hl = "Special" }, align = "center", padding = 2 },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },

    scroll = {
      enabled = false, -- Disable scrolling animations
    },
  },
}
