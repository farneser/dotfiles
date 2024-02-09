vim.opt.termguicolors = true

local themes = {
    "onedark",
    "catppuccin",
    "kanagawa-wave"
}

local function randomElement(list)
    math.randomseed(os.time())

    local index = math.random(#list)

    return list[index]
end

local function set_theme(color)
    vim.cmd.colorscheme(color)
end

-- Setup random theme on startup
set_theme(randomElement(themes))
