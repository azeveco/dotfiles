local function gh(repo) return 'https://github.com/' .. repo end

-- 1. Add dependencies and the main plugin
-- Note: vim.pack doesn't manage branches natively. You must ensure that 
-- your package lockfile or clone script specifically checks out the 'harpoon2' branch.
-- vim.pack.add("nvim-lua/plenary.nvim")
-- vim.pack.add("ThePrimeagen/harpoon")

---@type (string|vim.pack.Spec)[]
local harpoon_plugins = {
    gh 'nvim-lua/plenary.nvim',
    gh 'ThePrimeagen/harpoon'
}

-- NOTE: You can install multiple plugins at once
vim.pack.add(harpoon_plugins)

local harpoon = require("harpoon")

-- 2. Setup and Extensions (equivalent to `opts` and `config` function)
harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
})

local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

-- Windows
-- These buffer-local mappings control how entries from the Harpoon menu open.
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

-- File / Find
-- Harpoon keeps a short list of important files and lets you jump to them quickly.

vim.keymap.set("n", "<leader>h", function()
    harpoon:list():add()
end, { desc = "Harpoon File" })

vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Quick Menu" })

-- Quick jump bindings (1 through 4)
for i = 1, 4 do
    vim.keymap.set("n", "<leader>" .. i, function()
        harpoon:list():select(i)
    end, { desc = "Harpoon to File " .. i })
end
