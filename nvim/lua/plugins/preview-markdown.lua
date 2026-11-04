return {
    "skanehira/preview-markdown.vim",
    cmd = { "PreviewMarkdown" },
    ft = { "markdown" },
    keys = {
        { "<leader>mp", "<cmd>PreviewMarkdown<cr>", desc = "Markdown Preview Split" }
    },
    config = function()
        vim.g.preview_markdown_parser = 'glow -s dark'
        vim.g.preview_markdown_vertical = 1 
        vim.g.preview_markdown_auto_update = 1 

        -- vim.api.nvim_create_autocmd("BufWritePost", {
        --     pattern = "*.md", -- Only run this on Markdown files
        --     callback = function()
        --         -- Only attempt to rerun if the preview plugin has already been loaded
        --         if vim.fn.exists(":PreviewMarkdown") == 2 then
        --             -- Runs the command again, updating the existing split window
        --             vim.cmd("PreviewMarkdown")
        --         end
        --     end,
        -- })
    end
}
