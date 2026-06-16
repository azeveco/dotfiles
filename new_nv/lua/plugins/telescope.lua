return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    -- NEW: Configures global telescope defaults
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
        },
    },
    keys = {
        { "<leader>ff", ":Telescope find_files<cr>", mode = "n", desc = "Find Files" },
        { "<leader>fg", ":Telescope live_grep<cr>", mode = "n", desc = "Live Grep" },
        { "<leader>fb", ":Telescope buffers<cr>", mode = "n", desc = "Buffers" },
        { "<leader>fh", ":Telescope help_tags<cr>", mode = "n", desc = "Telescope Help Tags" },
        { "<leader>fk", ":Telescope keymaps<cr>", mode = "n", desc = "Keymaps" },
        { "<leader>fw", ":Telescope grep_string<cr>", mode = {"n", "v"}, desc = "Word" },
        -- {
        --   "<leader>fc",
        --   function()
        --     require("telescope.builtin").colorscheme({ 
        --       enable_preview = true,    -- Forces live preview as you cycle
        --       ignore_builtins = false,   -- Optional: Hides default vim themes like 'desert/elflord'
        --     })
        --   end,
        --   desc = "Find Colorscheme (with Preview)",
        -- },
    }
}
