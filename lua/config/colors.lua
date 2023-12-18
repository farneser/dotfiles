vim.opt.termguicolors = true

local themes = {"onedark", "catppuccin", "kanagawa-wave"}

function randomElement(list)
    math.randomseed(os.time())

    local index = math.random(#list)

    return list[index]
end

function SetColor(color)
    vim.cmd.colorscheme(color)
end

SetColor(randomElement(themes))
