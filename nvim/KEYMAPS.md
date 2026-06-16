# KEYMAPS

This file documents the active custom keymaps defined in:

- `lua/keymaps.lua`
- `lua/autocmds.lua`
- `lua/azeveco/plugins/*.lua`

It includes global mappings and context-specific plugin-local mappings. Commented-out mappings are not included.

## General

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<Esc>` | `n` | — | Clears search highlighting. |
| `<C-s>` | `n`, `i`, `x`, `s` | Save File | Saves the current file and returns to normal mode. |
| `<Esc><Esc>` | `t` | Exit terminal mode | Leaves terminal insert mode and returns to terminal-normal mode. |
| `<A-j>` | `n` | Move Down | Moves the current line down. |
| `<A-k>` | `n` | Move Up | Moves the current line up. |
| `<A-j>` | `i` | Move Down | Moves the current line down while staying in insert mode. |
| `<A-k>` | `i` | Move Up | Moves the current line up while staying in insert mode. |
| `<A-j>` | `v` | Move Down | Moves the selected lines down and reindents them. |
| `<A-k>` | `v` | Move Up | Moves the selected lines up and reindents them. |
| `<leader>p` | `x` | — | Pastes over a selection without overwriting the default register. |
| `<leader>_` | `n`, `v` | Delete Without Yanking | Deletes text into the black-hole register. |
| `<leader>r` | `n`, `v` | Search & Replace | Starts a project-wide substitute using the word under cursor. |

## Diagnostics / Quickfix

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>cd` | `n` | Line Diagnostics | Opens diagnostics for the current line. |
| `]d` | `n` | Next Diagnostic | Jumps to the next diagnostic and opens its float. |
| `[d` | `n` | Prev Diagnostic | Jumps to the previous diagnostic and opens its float. |
| `]e` | `n` | Next Error | Jumps to the next error diagnostic. |
| `[e` | `n` | Prev Error | Jumps to the previous error diagnostic. |
| `]w` | `n` | Next Warning | Jumps to the next warning diagnostic. |
| `[w` | `n` | Prev Warning | Jumps to the previous warning diagnostic. |
| `<leader>xl` | `n` | Open Diagnostic Location List | Sends diagnostics to the location list. |

## Files / Find / Explorer

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>fn` | `n` | New File | Opens a new empty buffer. |
| `\` | `n` | NeoTree reveal | Reveals the current file in Neo-tree. |
| `<leader><space>` | `n` | Find Files (Root Dir) | Opens Snacks file picker scoped to the project root. |
| `<leader>,` | `n` | Buffers | Opens Snacks buffer picker. |
| `<leader>:` | `n` | Command History | Opens Snacks command history picker. |
| `<leader>e` | `n` | Explorer Snacks (root dir) | Opens Snacks explorer at the project root. |
| `<leader>E` | `n` | Explorer Snacks (cwd) | Opens Snacks explorer at the current working directory. |
| `<leader>fb` | `n` | Buffers | Opens Snacks buffer picker. |
| `<leader>fB` | `n` | Buffers (all) | Opens buffer picker including hidden and `nofile` buffers. |
| `<leader>fc` | `n` | Find Config File | Opens file picker scoped to your Neovim config directory. |
| `<leader>ff` | `n` | Find Files (Root Dir) | Opens file picker scoped to the project root. |
| `<leader>fF` | `n` | Find Files (cwd) | Opens file picker scoped to the current working directory. |
| `<leader>fg` | `n` | Find Git Files | Opens Git-tracked files picker. |
| `<leader>fp` | `n` | Projects | Opens Snacks projects picker. |
| `<leader>fr` | `n` | Recent | Opens recent files scoped to the project root. |
| `<leader>fR` | `n` | Recent (cwd) | Opens recent files scoped to the current working directory. |
| `<leader>fe` | `n` | Explorer Snacks (root dir) | Opens Snacks explorer at the project root. |
| `<leader>fE` | `n` | Explorer Snacks (cwd) | Opens Snacks explorer at the current working directory. |
| `<leader>fs` | `n` | Smart Find Files | Opens Snacks smart picker. |
| `<leader>h` | `n` | Harpoon File | Adds the current file to Harpoon. |
| `<leader>1` | `n` | Harpoon to File 1 | Jumps to Harpoon slot 1. |
| `<leader>2` | `n` | Harpoon to File 2 | Jumps to Harpoon slot 2. |
| `<leader>3` | `n` | Harpoon to File 3 | Jumps to Harpoon slot 3. |
| `<leader>4` | `n` | Harpoon to File 4 | Jumps to Harpoon slot 4. |
| `<C-e>` | `n` | Harpoon Quick Menu | Toggles the Harpoon quick menu. |

## Search

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>/` | `n` | Grep (Root Dir) | Opens Snacks grep picker scoped to the project root. |
| `<leader>sr` | `n`, `x` | Search and Replace | Opens Grug Far, prefiltered to the current file extension when possible. |
| `<leader>sB` | `n` | Grep Open Buffers | Greps only through open buffers. |
| `<leader>sg` | `n` | Grep (Root Dir) | Greps the project root. |
| `<leader>sG` | `n` | Grep (cwd) | Greps the current working directory. |
| `<leader>sw` | `n`, `x` | Visual selection or word (Root Dir) | Greps the word or selection in the project root. |
| `<leader>sW` | `n`, `x` | Visual selection or word (cwd) | Greps the word or selection in the current working directory. |
| `<leader>s"` | `n` | Registers | Opens register picker. |
| `<leader>s/` | `n` | Search History | Opens search history picker. |
| `<leader>sa` | `n` | Autocmds | Opens autocmd picker. |
| `<leader>sb` | `n` | Buffer Lines | Opens line picker for the current buffer. |
| `<leader>sc` | `n` | Command History | Opens command history picker. |
| `<leader>sC` | `n` | Commands | Opens commands picker. |
| `<leader>sd` | `n` | Diagnostics | Opens diagnostics picker. |
| `<leader>sD` | `n` | Buffer Diagnostics | Opens diagnostics for the current buffer. |
| `<leader>sh` | `n` | Help Pages | Opens help tags picker. |
| `<leader>sH` | `n` | Highlights | Opens highlight groups picker. |
| `<leader>si` | `n` | Icons | Opens icon picker. |
| `<leader>sj` | `n` | Jumps | Opens jumplist picker. |
| `<leader>sk` | `n` | Keymaps | Opens keymaps picker. |
| `<leader>sl` | `n` | Location List | Opens location list picker. |
| `<leader>sm` | `n` | Marks | Opens marks picker. |
| `<leader>sM` | `n` | Man Pages | Opens man pages picker. |
| `<leader>sp` | `n` | Search for Plugin Spec | Opens picker for plugin specs. |
| `<leader>sq` | `n` | Quickfix List | Opens quickfix list picker. |
| `<leader>sR` | `n` | Resume | Resumes the last Snacks picker. |
| `<leader>su` | `n` | Undo History | Opens undo history picker. |

## Windows

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>-` | `n` | Split Window Below | Splits the current window horizontally. |
| `<leader>\|` | `n` | Split Window Right | Splits the current window vertically. |
| `<leader>wd` | `n` | Delete Window | Closes the current window. |
| `<C-h>` | `n` | — | Moves to the tmux pane / Neovim split on the left. |
| `<C-j>` | `n` | — | Moves to the tmux pane / Neovim split below. |
| `<C-k>` | `n` | — | Moves to the tmux pane / Neovim split above. |
| `<C-l>` | `n` | — | Moves to the tmux pane / Neovim split on the right. |
| `<C-\>` | `n` | — | Jumps to the previous tmux pane. |
| `<C-w><space>` | `n` | Window Hydra Mode (which-key) | Opens which-key for window commands and keeps it active. |

## Tabs

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader><tab>l` | `n` | Last Tab | Jumps to the last tab. |
| `<leader><tab>o` | `n` | Close Other Tabs | Closes every tab except the current one. |
| `<leader><tab>f` | `n` | First Tab | Jumps to the first tab. |
| `<leader><tab><tab>` | `n` | New Tab | Creates a new tab. |
| `<leader><tab>]` | `n` | Next Tab | Jumps to the next tab. |
| `<leader><tab>d` | `n` | Close Tab | Closes the current tab. |
| `<leader><tab>[` | `n` | Previous Tab | Jumps to the previous tab. |

## Buffers

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<S-h>` | `n` | Prev Buffer | Switches to the previous buffer. |
| `<S-l>` | `n` | Next Buffer | Switches to the next buffer. |
| `[b` | `n` | Prev Buffer | Switches to the previous buffer. |
| `]b` | `n` | Next Buffer | Switches to the next buffer. |
| `<leader>bb` | `n` | Switch to Other Buffer | Switches to the alternate buffer. |
| `<leader>\`` | `n` | Switch to Other Buffer | Switches to the alternate buffer. |
| `<leader>bd` | `n` | Delete Buffer | Deletes the current buffer using Snacks. |
| `<leader>bo` | `n` | Delete Other Buffers | Deletes all other buffers. |
| `<leader>bi` | `n` | Delete Invisible Buffers | Deletes buffers not visible in any window. |
| `<leader>bD` | `n` | Delete Buffer and Window | Runs `:bd` on the current buffer. |
| `<leader>?` | `n` | Buffer Keymaps (which-key) | Shows buffer-local keymaps in which-key. |
| `<leader>.` | `n` | Toggle Scratch Buffer | Opens or hides the Snacks scratch buffer. |
| `<leader>S` | `n` | Select Scratch Buffer | Opens the Snacks scratch buffer picker. |

## Git

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>gb` | `n` | Git Branches | Opens branch picker. |
| `<leader>gl` | `n` | Git Log | Opens Git log picker. |
| `<leader>gL` | `n` | Git Log Line | Opens Git log for the current line. |
| `<leader>gs` | `n` | Git Status | Opens Git status picker. |
| `<leader>gS` | `n` | Git Stash | Opens Git stash picker. |
| `<leader>gd` | `n` | Git Diff (Hunks) | Opens diff hunks picker. |
| `<leader>gD` | `n` | Git Diff (origin) | Opens diff against `origin`. |
| `<leader>gf` | `n` | Git Log File | Opens file history picker. |
| `<leader>gB` | `n`, `v` | Git Browse (open) | Opens the current file/selection in the remote Git host. |
| `<leader>gY` | `n`, `x` | Git Browse (copy) | Copies the remote Git URL for the current file/selection. |
| `<leader>gg` | `n` | Lazygit (Root Dir) | Opens Lazygit at the project root when `lazygit` is installed. |
| `<leader>gG` | `n` | Lazygit (cwd) | Opens Lazygit in the current working directory when `lazygit` is installed. |

## Git Hunks (buffer-local, Gitsigns)

These mappings are active only in buffers where Gitsigns is attached.

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `]c` | `n` | Jump to next git change | Jumps to the next hunk, or uses diff navigation in diff mode. |
| `[c` | `n` | Jump to previous git change | Jumps to the previous hunk, or uses diff navigation in diff mode. |
| `<leader>hs` | `n`, `v` | git stage hunk | Stages the current hunk or selected hunk range. |
| `<leader>hr` | `n`, `v` | git reset hunk | Resets the current hunk or selected hunk range. |
| `<leader>hS` | `n` | git Stage buffer | Stages the whole buffer. |
| `<leader>hR` | `n` | git Reset buffer | Resets the whole buffer. |
| `<leader>hp` | `n` | git preview hunk | Previews the current hunk. |
| `<leader>hi` | `n` | git preview hunk inline | Shows an inline preview of the current hunk. |
| `<leader>hb` | `n` | git blame line | Shows full blame for the current line. |
| `<leader>hd` | `n` | git diff against index | Diffs the buffer against the index. |
| `<leader>hD` | `n` | git Diff against last commit | Diffs the buffer against the previous commit. |
| `<leader>hQ` | `n` | git hunk Quickfix list (all files in repo) | Sends all repo hunks to the quickfix list. |
| `<leader>hq` | `n` | git hunk quickfix list (all changes in this file) | Sends current-file hunks to the quickfix list. |
| `<leader>tb` | `n` | Toggle git show blame line | Toggles inline blame for the current line. |
| `<leader>tw` | `n` | Toggle git intra-line word diff | Toggles word diff highlighting. |
| `ih` | `o`, `x` | — | Selects the current git hunk as a text object. |

## Code / LSP / Formatting

## LSP actions

These mappings are buffer-local and become active when an LSP attaches to the buffer.

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>cm` | `n` | Mason | Opens Mason. |
| `<leader>cl` | `n` | LSP: Lsp Info | Opens `:LspInfo`. |
| `grn` | `n` | LSP: Rename | Renames the symbol under cursor. |
| `<leader>cr` | `n` | LSP: Code Rename | Renames the symbol under cursor. |
| `gra` | `n`, `x` | LSP: Goto Code Action | Opens code actions for the current context. |
| `<leader>ca` | `n`, `x` | LSP: Code Action | Opens code actions for the current context. |
| `<leader>cA` | `n` | LSP: Code Source Action | Applies source-level code actions. |
| `<leader>co` | `n` | LSP: Code Organize Imports | Runs organize imports via LSP code action. |
| `gd` | `n` | LSP: Goto Definition | Jumps directly to the definition. |
| `gD` | `n` | LSP: Goto Declaration | Jumps directly to the declaration. |
| `grD` | `n` | LSP: Goto Declaration | Alternate declaration mapping. |
| `K` | `n` | LSP: Hover | Shows hover documentation. |
| `gK` | `n` | LSP: Signature Help | Shows signature help. |
| `<leader>th` | `n` | LSP: Toggle Inlay Hints | Toggles inlay hints when supported by the active LSP. |

## LSP navigation with Snacks

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `gr` | `n` | References | Opens LSP references in a picker. |
| `gI` | `n` | Goto Implementation | Opens implementations in a picker. |
| `gy` | `n` | Goto Type Definition | Opens type definitions in a picker. |
| `gai` | `n` | Calls Incoming | Opens incoming calls in a picker. |
| `gao` | `n` | Calls Outgoing | Opens outgoing calls in a picker. |
| `<leader>ss` | `n` | LSP Symbols | Opens document symbols picker. |
| `<leader>sS` | `n` | LSP Workspace Symbols | Opens workspace symbols picker. |
| `]]` | `n`, `t` | Next Reference | Jumps to the next reference via Snacks words. |
| `[[` | `n`, `t` | Prev Reference | Jumps to the previous reference via Snacks words. |
| `<leader>cR` | `n` | Rename File | Renames the current file and updates references when supported. |

## Formatting

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>cf` | `n`, `v` | Code Format | Formats the current buffer or selection using Conform. |

## UI / Toggles / Notifications

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>us` | `n` | Spelling | Toggles `spell`. |
| `<leader>uw` | `n` | Wrap | Toggles `wrap`. |
| `<leader>uL` | `n` | Relative Number | Toggles `relativenumber`. |
| `<leader>ud` | `n` | Diagnostics | Toggles diagnostics display. |
| `<leader>ul` | `n` | Line Number | Toggles line numbers. |
| `<leader>uc` | `n` | Conceallevel | Toggles conceal level. |
| `<leader>uT` | `n` | Treesitter | Toggles Treesitter highlighting. |
| `<leader>ub` | `n` | Dark Background | Toggles background between light and dark. |
| `<leader>uh` | `n` | Inlay Hints | Toggles Snacks inlay hints helper. |
| `<leader>ug` | `n` | Indent | Toggles Snacks indent guides. |
| `<leader>uD` | `n` | Dim | Toggles dimming. |
| `<leader>uz` | `n` | Toggle Zen Mode | Toggles Zen mode. |
| `<leader>uZ` | `n` | Toggle Zoom | Toggles zoomed Zen window. |
| `<leader>uC` | `n` | Colorschemes | Opens colorscheme picker. |
| `<leader>n` | `n` | Notification History | Opens notifications picker. |
| `<leader>un` | `n` | Dismiss All Notifications | Hides all current notifications. |
| `<C-/>` | `n` | Toggle Terminal | Opens or hides the Snacks terminal. |
| `<C-_>` | `n` | which_key_ignore | Alternate terminal toggle keycode for terminals that send `<C-_>`. |

## Sessions

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<leader>qs` | `n` | Restore Session | Restores the current session. |
| `<leader>qS` | `n` | Select Session | Opens the session picker. |
| `<leader>ql` | `n` | Restore Last Session | Restores the last session. |
| `<leader>qd` | `n` | Don't Save Current Session | Stops session saving for the current session. |

## Debug

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `<F5>` | `n` | Debug: Start/Continue | Starts or continues the debugger. |
| `<F1>` | `n` | Debug: Step Into | Steps into the current function call. |
| `<F2>` | `n` | Debug: Step Over | Steps over the current line. |
| `<F3>` | `n` | Debug: Step Out | Steps out of the current function. |
| `<leader>db` | `n` | Debug: Toggle Breakpoint | Toggles a breakpoint on the current line. |
| `<leader>dB` | `n` | Debug: Set Breakpoint | Sets a conditional breakpoint. |
| `<F7>` | `n` | Debug: See last session result. | Toggles the DAP UI. |

## Motion / Jump plugins

| Keymap | Mode(s) | Description | What it does |
| --- | --- | --- | --- |
| `s` | `n`, `x`, `o` | Flash | Jumps to visible matches using Flash labels. |
| `S` | `n`, `o`, `x` | Flash Treesitter | Jumps using Treesitter nodes. |
| `r` | `o` | Remote Flash | Uses Flash remote action in operator-pending mode. |
| `R` | `o`, `x` | Treesitter Search | Searches Treesitter nodes via Flash. |
| `<C-s>` | `c` | Toggle Flash Search | Toggles Flash integration in command-line search. |
| `<C-Space>` | `n`, `o`, `x` | Treesitter Incremental Selection | Starts/advances Treesitter selection through Flash. |

## Context-specific / plugin-local mappings

These mappings only exist inside a specific plugin buffer or UI.

### Snacks picker and explorer

| Keymap | Mode(s) | Context | What it does |
| --- | --- | --- | --- |
| `<Esc>` | `n`, `i` | Snacks picker input/list and explorer list | Cancels and closes the picker. |
| `<C-o>` | `n`, `i` | Snacks picker input/list and explorer list | Picks a target window and opens the selected item there. |
| `<C-e>` | `n`, `i` | Snacks picker input/list | Opens the selected item in a vertical split. |
| `<A-t>` | `n`, `i` | Snacks picker input | Toggles the custom “Ruby only” grep filter. |
| `<A-n>` | `n`, `i` | Snacks picker input | Toggles the custom “hide tests” grep filter. |
| `<S-Y>` | `n` | Snacks explorer list | Copies the selected file path to the clipboard. |

### Harpoon quick menu

| Keymap | Mode(s) | Context | What it does |
| --- | --- | --- | --- |
| `<C-v>` | `n` | Harpoon quick menu buffer | Opens the selected Harpoon entry in a vertical split. |
| `<C-x>` | `n` | Harpoon quick menu buffer | Opens the selected Harpoon entry in a horizontal split. |
| `<C-t>` | `n` | Harpoon quick menu buffer | Opens the selected Harpoon entry in a new tab. |

### Neo-tree

| Keymap | Mode(s) | Context | What it does |
| --- | --- | --- | --- |
| `\` | `n` | Neo-tree filesystem window | Closes the Neo-tree window. |

### Quick-close helper

The following mapping is created automatically for these filetypes: `PlenaryTestPopup`, `checkhealth`, `dap-float`, `dbout`, `gitsigns-blame`, `grug-far`, `help`, `lspinfo`, `neotest-output`, `neotest-output-panel`, `neotest-summary`, `notify`, `qf`, `spectre_panel`, `startuptime`, `tsplayground`.

| Keymap | Mode(s) | Context | What it does |
| --- | --- | --- | --- |
| `q` | `n` | Special utility buffers listed above | Closes the window and deletes the temporary buffer. |
