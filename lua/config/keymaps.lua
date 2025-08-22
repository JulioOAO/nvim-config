local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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
