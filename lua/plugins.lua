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
    -- Themes
    { 'joshdick/onedark.vim' },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'rebelot/kanagawa.nvim' },
    
    -- Plugins
    { 'nvim-treesitter/nvim-treesitter' }, 
    {
	    'glepnir/dashboard-nvim',
	    event = 'VimEnter',
	    dependencies = {{'nvim-tree/nvim-web-devicons'}}
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "s1n7ax/nvim-window-picker",
        }
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-lualine/lualine.nvim' },
    { 'VonHeikemen/fine-cmdline.nvim' },
    { 
        'rcarriga/nvim-notify', 
        release = "latest"
    },
    { "lewis6991/gitsigns.nvim" },
})
