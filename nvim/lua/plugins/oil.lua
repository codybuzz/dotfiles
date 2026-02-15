return {
    'stevearc/oil.nvim',
    opts = {
        constrain_cursor = "name",
        keymaps = {
            ["<C-v>"] = { "actions.select", opts = { vertical = true } },
            ["<C-s>"] = false,
            ["<C-o>"] = "actions.select",
            ["<C-b>"] = "actions.parent",
        },
        columns = {
            { "permissions", highlight = "@number" },
            { "size", highlight = "@property" },
            "icon",
        },
        float = {
            padding = 5,
            border = "rounded", -- "single", "double", "rounded", "shadow"
            win_options = {
                winblend = 0, -- Makes it non-transparent if 0, increase for transparency
            },
            preview_split = "right",
            override = function(conf)
                conf.col = conf.col + 5
                conf.width = conf.width - 10
                return conf
            end,
        },
        view_options = {
            -- show_hidden = true,
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
}
