return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    },
    keys = function()
        local keys = {
            { "<leader>H", false }, 
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
            -- Vertical layout with file preview panel below
            {
                "<leader>he",
                function()
                    local harpoon = require("harpoon")
                    local conf = require("telescope.config").values
                    local action_state = require("telescope.actions.state")
                    
                    -- Dynamic array builder for Telescope
                    local function generate_harpoon_picker()
                        local file_paths = {}
                        for _, item in ipairs(harpoon:list().items) do
                            if item and item.value and item.value ~= "" then
                                table.insert(file_paths, item.value)
                            end
                        end
                        return file_paths
                    end

                    require("telescope.pickers").new({}, {
                        prompt_title = "Harpoon List",
                        sorting_strategy = "ascending", 
                        layout_strategy = "vertical",   
                        layout_config = {
                            width = 0.55,
                            height = 0.65,
                            prompt_position = "top",
                            mirror = true,             
                        },
                        finder = require("telescope.finders").new_table({
                            results = generate_harpoon_picker(),
                        }),
                        previewer = conf.file_previewer({}),
                        sorter = conf.generic_sorter({}),
                        attach_mappings = function(prompt_bufnr, map)
                            -- Deletion Mapping via <C-d> (Navigation mappings inherited globally)
                            map("i", "<C-d>", function()
                                local selection = action_state.get_selected_entry()
                                if selection == nil then return end
                                
                                local harpoon_list = harpoon:list()
                                local extensions = require("harpoon.extensions")
                                
                                for idx, item in ipairs(harpoon_list.items) do
                                    if item.value == selection.value then
                                        table.remove(harpoon_list.items, idx)
                                        harpoon_list._length = harpoon_list._length - 1
                                        
                                        extensions.extensions:emit(
                                            extensions.event_names.REMOVE,
                                            { list = harpoon_list, item = item, idx = idx }
                                        )
                                        break
                                    end
                                end
                                
                                local current_picker = action_state.get_current_picker(prompt_bufnr)
                                if current_picker then
                                    current_picker:refresh(
                                        require("telescope.finders").new_table({
                                            results = generate_harpoon_picker(),
                                        }),
                                        { reset_prompt = true }
                                    )
                                end
                            end)
                            return true
                        end,
                    }):find()
                end,
                desc = "Harpoon Telescope Search",
            },
        }

        for i = 1, 4 do
            table.insert(keys, {
                "<leader>" .. i,
                function()
                    require("harpoon"):list():select(i)
                end,
                desc = "Harpoon to File " .. i,
            })
        end
        return keys
    end,
    config = function(_, opts)
        local harpoon = require("harpoon")
        harpoon:setup(opts)

        local harpoon_extensions = require("harpoon.extensions")
        harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-x>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-t>", function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end, { buffer = cx.bufnr })
            end,
        })
    end,
}
