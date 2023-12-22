return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "bash", "css", "dockerfile", "gitignore", "html",
                    "java", "javascript","json", "kotlin", "lua", "markdown",
                    "python", "scss", "sql", "ssh_config", "toml", "tsx",
                    "typescript", "xml", "yaml"
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            }
        end
    }
}
