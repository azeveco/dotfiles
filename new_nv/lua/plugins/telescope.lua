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
        { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Live Grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n", desc = "Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n", desc = "Telescope Help Tags" },
    }
}
