return {
    "navarasu/onedark.nvim",
    version = "*",
    priority = 1000,   -- Ensure it loads before other plugins
    config = function()
        require("onedark").setup({
            style = "deep" -- (options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light')
        })
        require("onedark").load()
    end
}
