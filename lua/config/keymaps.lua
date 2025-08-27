local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Navigation between buffers
map('n', '<A-h>', '<cmd>bprev<CR>', { desc = 'Move to the previous buffer' })
map('n', '<A-l>', '<cmd>bnext<CR>', { desc = 'Move to the previous buffer' })

-- Tab navigation
map('n', '<S-Tab>', 'gt', { desc = 'Move to next [t]ab' })

-- Keybindings for resizing windows
map('n', '<C-Up>', '<C-w>+', { desc = 'Increase window height' })
map('n', '<C-Down>', '<C-w>-', { desc = 'Decrease window height' })
map('n', '<C-Right>', '<C-w>>', { desc = 'Increase window width' })
map('n', '<C-Left>', '<C-w><lt>', { desc = 'Decrease window width' })

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Terminal keymaps
require('utils.terminal')
map({ 'n', 't' }, '<A-t>', ToggleTerminal, { desc = '[T]oggle terminal window' })
map('t', '<Esc>', '<C-\\><C-n>', { desc = '[T]erminal: Exit insert mode' })

-- Neotree keymaps
map('n', '<leader>e', '<cmd>Neotree filesystem reveal toggle<CR>', { desc = 'Toggle Neotree' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Tabs keymaps
map('n', '<C-t>', '<cmd>tabnew<CR>', { desc = 'Open New [T]ab' })

-- File editing keymaps
map('n', '<C-s>', '<cmd>w<CR>', { desc = '[S]ave file in buffer' })
map('n', '<C-S>', '<cmd>wa<CR>', { desc = '[S]ave [A]ll files in buffers' })

-- Move lines
map("n", "<A-j>", ":m .+1<cr>==")
map("n", "<A-k>", ":m .-2<cr>==")
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi")
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi")
map("x", "<A-j>", ":m '>+1<cr>gv=gv")
map("x", "<A-k>", ":m '<-2<cr>gv=gv")

-- Gitsigns: hunk manipulation
map('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = 'Gitsigns: [s]tage [h]unk' })
map('v', '<leader>hu', '<cmd>Gitsigns unstage_hunk<CR>', { desc = 'Gitsigns: [u]nstage [h]unk' })
map('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = 'Gitsigns: [r]eset [h]unk' })
map('n', '<leader>hi', '<cmd>Gitsigns preview_hunk_inline<CR>', { desc = 'Gitsigns: preview [h]unk [i]nline' })
map('n', '<leader>hP', '<cmd>Gitsigns preview_hunk<CR>', { desc = 'Gitsigns: [P]review [h]unk' })
map('n', '<leader>hn', '<cmd>Gitsigns nav_hunk next<CR>', { desc = 'Gitsigns: navigate to [n]ext hunk' })
map('n', '<leader>hp', '<cmd>Gitsigns nav_hunk prev<CR>', { desc = 'Gitsigns: navigate to [p]revious hunk' })
map('n', '<leader>hq', '<cmd>Gitsigns setloclist<CR>', { desc = 'Gitsigns: Show [h]unk location list' })

-- Gitsigns: blame
map('n', '<leader>gB', '<cmd>Gitsigns blame<CR>', { desc = 'Gitsigns: [B]lame' })
map('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>', { desc = 'Gitsigns: [b]lame line' })
map('n', '<leader>gt', '<cmd>Gitsigns toggle_current_line_blame<CR>',
    { desc = 'Gitsigns: [t]oggle current line blame' })
