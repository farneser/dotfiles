return {
    'rcarriga/nvim-notify',
    release = "latest",
    config = function()
        vim.notify = require("notify")
    end
}
