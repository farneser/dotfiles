return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "pylsp", "jdtls", "kotlin_language_server",
                    "taplo", "lemminx", "hydra_lsp", "marksman"
                },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})
            lspconfig.pylsp.setup({})
            lspconfig.jdtls.setup({})
            lspconfig.kotlin_language_server.setup({})
            lspconfig.taplo.setup({})
            lspconfig.lemminx.setup({})
            lspconfig.hydra_lsp.setup({})
            lspconfig.marksman.setup({})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end
    },
}
