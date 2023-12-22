vim.g.mapleader = " "

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree toggle<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Common
vim.keymap.set('n', '<C-d>', ':t.<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>cd', ':cd %:h<CR>')
