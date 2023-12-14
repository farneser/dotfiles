local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'joshdick/onedark.vim' },
    { 'nvim-treesitter/nvim-treesitter' }, 
    {
	    'glepnir/dashboard-nvim',
	    event = 'VimEnter',
	    dependencies = {{'nvim-tree/nvim-web-devicons'}}
    },
    { 'windwp/nvim-ts-autotag' }, 
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        }
    },
    {'rebelot/kanagawa.nvim'},
})
