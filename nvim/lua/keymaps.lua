-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- General
-- These are editor-wide convenience mappings that don't belong to a single plugin
-- or leader category. They cover common actions like clearing UI state and saving.

-- Clear highlights on search when pressing <Esc> in normal mode.
-- Keep insert/select mode on their default behavior so <Esc> still exits them.
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Save the current buffer quickly from normal, insert, select, or visual mode.
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", ":w<cr><esc>", { desc = "Save File" })

-- Exit terminal mode without needing the default <C-\><C-n> chord.
-- This is easier to remember when using the builtin terminal.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Move lines or selections up and down while keeping indentation tidy.
vim.keymap.set("n", "<A-j>", ":execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", ":execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc>:m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc>:m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Keep pasted-over text out of the default register and provide quick black-hole deletes.
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>_", "\"_d", { desc = "Delete Without Yanking" })

-- Search and replace the word under cursor, ready for interactive editing.
vim.keymap.set({ "n", "v" }, "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search & Replace" })

-- Better indenting
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Diagnostics / Quickfix
-- These mappings configure diagnostics and make it easier to jump through issues,
-- inspect messages, and send them to the location list.

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
vim.keymap.set('n', '<leader>xl', vim.diagnostic.setloclist, { desc = 'Open Diagnostic Location List' })

-- File / Find
-- This section groups file-oriented actions such as creating a fresh buffer to edit.

-- Open a brand new empty buffer when starting a scratch file.
vim.keymap.set("n", "<leader>fn", ":enew<cr>", { desc = "New File" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', ':echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', ':echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', ':echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', ':echo "Use j to move!!"<CR>')

-- Windows
-- Window management is split between direct movement keys and leader-based layout actions.

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Leader-based window commands mirror the `<C-w>` namespace for common layout changes.
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Tabs
-- Tab actions live under `<leader><tab>` to match the which-key tab category.

-- Navigate and manage tab pages from a single prefix.
vim.keymap.set("n", "<leader><tab>l", ":tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>o", ":tabonly<cr>", { desc = "Close Other Tabs" })
vim.keymap.set("n", "<leader><tab>f", ":tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", ":tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", ":tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", ":tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", ":tabprevious<cr>", { desc = "Previous Tab" })

-- Buffers
-- Buffer navigation and cleanup stay together so buffer-local workflow is easy to scan.

-- Move across the buffer list and jump back to the previous buffer quickly.
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", ":bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", ":bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", ":e #<cr>", { desc = "Switch to Other Buffer" })
-- vim.keymap.set("n", "<leader>`", ":e #<cr>", { desc = "Switch to Other Buffer" })

-- Buffer deletion commands include focused cleanup helpers from Snacks.
vim.keymap.set("n", "<leader>bd", function()
  require("snacks").bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", function()
  require("snacks").bufdelete.other()
end, { desc = "Delete Other Buffers" })
vim.keymap.set("n", "<leader>bi", function()
  require("snacks").bufdelete.invisible()
end, { desc = "Delete Invisible Buffers" })
vim.keymap.set("n", "<leader>bD", "::bd<cr>", { desc = "Delete Buffer and Window" })
