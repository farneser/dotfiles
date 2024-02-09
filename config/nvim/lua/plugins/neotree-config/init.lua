return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },
    config = function()
        require 'window-picker'.setup({
            autoselect_one = false,
            include_current = false,
            filter_rules = {
                bo = {
                    filetype = {'neo-tree', "neo-tree-popup", "notify"},
                    buftype = {'terminal', "quickfix"}
                }
            },
            other_win_hl_color = '#e35e4f'
        })

        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

        vim.fn.sign_define("DiagnosticSignError",
                           {text = " ", texthl = "DiagnosticSignError"})
        vim.fn.sign_define("DiagnosticSignWarn",
                           {text = " ", texthl = "DiagnosticSignWarn"})
        vim.fn.sign_define("DiagnosticSignInfo",
                           {text = " ", texthl = "DiagnosticSignInfo"})
        vim.fn.sign_define("DiagnosticSignHint",
                           {text = "", texthl = "DiagnosticSignHint"})
        vim.keymap.set('n', '<leader>E', ':Neotree toggle<CR>')
        vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
        vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

        require("neo-tree").setup({
            source_selector = {
                winbar = false,
                statusline = false
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
        })
    end
}
