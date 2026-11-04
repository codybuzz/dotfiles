return {
    "navarasu/onedark.nvim",
    version = "*",
    priority = 1000,   -- Ensure it loads before other plugins
    config = function()
        require("onedark").setup({
            style = "deep" -- (options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light')
        })
        require("onedark").load()
        c = require('onedark.colors')
        vim.api.nvim_set_hl(0, "Title", { fg = c.bg1 })
        vim.api.nvim_set_hl(0, "LineNr", { fg = c.fg })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF" })
    end
}
