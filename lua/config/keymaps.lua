local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Terminal keymaps
require('config.terminal')
map({ 'n', 't' }, '<A-t>', ToggleTerminal, { desc = '[T]oggle terminal window' })
map('t', '<Esc>', '<C-\\><C-n>', { desc = '[T]erminal: Exit insert mode' })

map('n', '<leader>e', '<cmd>Neotree filesystem reveal toggle<CR>', { desc = 'Toggle Neotree' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('n', '<C-t>', '<cmd>tabnew<CR>', { desc = 'Open New [T]ab' })
