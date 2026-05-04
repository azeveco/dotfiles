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
      toggles = {
        ruby_only = "💎",
        hide_tests = "🚫",
      },
      actions = {
        toggle_ruby = function(picker)
          if picker.opts.args and vim.tbl_contains(picker.opts.args, "ruby") then
            picker.opts.args = {} -- Clear args (search all files)
            picker.opts["ruby_only"] = false
            Snacks.notify.info("Grep: All Files")
          else
            picker.opts.args = { "-t", "ruby" } -- Force Ruby type
            picker.opts["ruby_only"] = true
            Snacks.notify.info("Grep: Ruby Only")
          end
          -- Trigger the search again with new options
          picker:find()
        end,
        hide_tests = function(picker)
          -- Check for the specific glob string "!*_test*"
          if picker.opts.args and vim.tbl_contains(picker.opts.args, "!*_test.rb*") then
            picker.opts.args = {} -- Clear args (Include tests again)
            picker.opts["hide_tests"] = false
            Snacks.notify.info("Grep: Including Tests")
          else
            picker.opts.args = { "-g", "!*_test.rb*" } -- Force exclude glob
            picker.opts["hide_tests"] = true
            Snacks.notify.info("Grep: Excluding Tests")
          end
          -- Trigger the search again
          picker:find()
        end,
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
                ["<S-Y>"] = "copy_file_path",
              },
            },
          },
          actions = {
            copy_file_path = {
              action = function(_, item)
                if not item then
                  return
                end

                local result = vim.fn.fnamemodify(item.file, ":.")
                if result then
                  vim.fn.setreg("+", result)
                  Snacks.notify.info("Yanked `" .. result .. "`")
                end
              end,
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<C-o>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
            ["<C-e>"] = { "edit_vsplit", mode = { "i", "n" } },
            ["<a-t>"] = { "toggle_ruby", mode = { "i", "n" } },
            ["<a-n>"] = { "hide_tests", mode = { "i", "n" } },
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
