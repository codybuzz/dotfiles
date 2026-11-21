return {
    "OXY2DEV/markview.nvim",
    -- markview lazy-loads itself, and must load before nvim-treesitter
    lazy = false,
    priority = 49,
    keys = {
        { "<leader>mp", "<cmd>Markview splitToggle<cr>", desc = "Markdown Preview Split" }
    },
}
