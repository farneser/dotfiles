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

require('dashboard').setup {
    theme = 'doom',
    config = {
        header = default_header(),
        center = {
            {
                icon = '󰙅 ',
                icon_hl = 'Title',
                desc = 'Open tree',
                desc_hl = 'String',
                key = 'e',
                keymap = 'SPC e',
                key_hl = 'Number',
                action = ':Neotree float'
            }
        }
    }
}
