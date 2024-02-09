vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Common
vim.keymap.set('n', '<C-d>', ':t.<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>cd', ':cd %:h<CR>')
