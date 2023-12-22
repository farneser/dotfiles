local function default_header()
    return {
        '', '', '',
        '███████╗██╗   ██╗ ██████╗       ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
        '██╔════╝██║   ██║██╔═══██╗      ████╗  ██║██║   ██║██║████╗ ████║',
        '█████╗  ██║   ██║██║   ██║█████╗██╔██╗ ██║██║   ██║██║██╔████╔██║',
        '██╔══╝  ╚██╗ ██╔╝██║   ██║╚════╝██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
        '███████╗ ╚████╔╝ ╚██████╔╝      ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
        '╚══════╝  ╚═══╝   ╚═════╝       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
        '', '', ''
    }
end

return {
    {
	    'glepnir/dashboard-nvim',
	    event = 'VimEnter',
	    dependencies = {{'nvim-tree/nvim-web-devicons'}},
        config = function()
            require('dashboard').setup {
            theme = 'doom',
            config = {
                header = default_header(),
                center = {
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'New file',
                        desc_hl = 'String',
                        key = 'e',
                        key_hl = 'Number',
                        action = ':edit new_file'
                    },
                    {
                        icon = '󰈞 ',
                        icon_hl = 'Title',
                        desc = 'Find file',
                        desc_hl = 'String',
                        key = 'f',
                        keymap = 'Ctrl p',
                        key_hl = 'Number',
                        action = ':Telescope find_files'
                    },
                    {
                        icon = '󰺮 ',
                        icon_hl = 'Title',
                        desc = 'Find content',
                        desc_hl = 'String',
                        key = 'f',
                        keymap = 'SPC f g',
                        key_hl = 'Number',
                        action = ':Telescope live_grep'
                    },
                    {
                        icon = '󰩈 ',
                        icon_hl = 'Title',
                        desc = 'Quit neovim',
                        desc_hl = 'String',
                        key = 'q',
                        key_hl = 'Number',
                        action = ':q'
                    }

                }
            }
        }
        end
    }
}
