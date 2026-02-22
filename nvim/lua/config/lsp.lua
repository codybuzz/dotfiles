
-- configure as needed
lsps = {
    "ruff",
    "clangd",
}

function setup_lsps()
    -- defaults
    lsps_enabled = false
    vim.lsp.enable(lsps, false)
    set_diagnostics(true)

    -- toggle lsps
    vim.keymap.set('n', '<leader>dd', function()
        lsps_enabled = not lsps_enabled
        vim.lsp.enable(lsps, lsps_enabled)
        if lsps_enabled then
            set_diagnostics(true)
        end
    end, { desc = 'Toggle lsps' })

    -- toggle diagnostics
    vim.keymap.set('n', '<leader>dh', function()
        local config = vim.diagnostic.config
        local new_val = not config().virtual_text
        set_diagnostics(new_val)
    end, { desc = 'Toggle diagnostics' })

    -- navigation keybinds
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { desc = 'Rename Symbol' })

    vim.keymap.set('n', '<leader>gd', function()
        require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit' })
    end, { noremap=true, silent=true, desc="Go to Definition" })
    vim.keymap.set('n', '<leader>gr', function()
        require('telescope.builtin').lsp_references({ jump_type='vsplit' })
    end, { noremap=true, silent=true, desc="Go to References" })
    vim.keymap.set('n', '<leader>gi', function()
        require('telescope.builtin').lsp_implementations({ jump_type='vsplit' })
    end, { noremap=true, silent=true, desc="Go to Implementation" })

    -- formatting
    vim.keymap.set({'n','v'}, '<leader>cf', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

    -- completion
    vim.o.completeopt = "menuone,noinsert"
    vim.keymap.set('i', '<Tab>', function()
      if vim.fn.pumvisible() ~= 0 then
        -- Select the item in the completion menu
        return '<C-y>'
      else
        -- Trigger omnicompletion
        return '<C-x><C-o>'
      end
    end, { expr = true, silent = true, desc = 'omnicompletion' })
end

function set_diagnostics(enabled)
    vim.diagnostic.config({ virtual_text = enabled, signs = enabled, underline = enabled })
end

setup_lsps()
