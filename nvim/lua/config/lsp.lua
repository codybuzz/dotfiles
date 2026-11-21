
lsps = {
    "clangd",
    "ruff",
    "pyright",
}

function setup_lsps()
    lsps_enabled = true
    vim.lsp.enable(lsps, true)
    set_diagnostics(true)

    -- use the same position encoding for all
    vim.lsp.config('*', {
        capabilities = {
            general = {
                positionEncodings = { "utf-16" }
            },
        },
    })

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

    -- diagnostic navigation (neovim defaults, set explicitly for reference)
    vim.keymap.set('n', ']d', function()
        vim.diagnostic.jump({ count = vim.v.count1 })
    end, { desc = 'Next Diagnostic' })
    vim.keymap.set('n', '[d', function()
        vim.diagnostic.jump({ count = -vim.v.count1 })
    end, { desc = 'Previous Diagnostic' })
    vim.keymap.set('n', ']D', function()
        vim.diagnostic.jump({ count = math.huge, wrap = false })
    end, { desc = 'Last Diagnostic' })
    vim.keymap.set('n', '[D', function()
        vim.diagnostic.jump({ count = -math.huge, wrap = false })
    end, { desc = 'First Diagnostic' })
    vim.keymap.set('n', '<C-w>d', vim.diagnostic.open_float, { desc = 'Show Diagnostic' })

    -- buffer-local keybinds, only set where an lsp is attached
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp_keymaps', { clear = true }),
        callback = function(args)
            set_lsp_keymaps(args.buf)
        end,
    })

    -- completion
    vim.o.completeopt = "menuone,noinsert"
    -- accept a completion with the built-in <C-y>
    vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { silent = true, desc = 'omnicompletion' })
end

function set_lsp_keymaps(bufnr)
    local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    -- navigation keybinds
    map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
    map('n', 'grd', vim.lsp.buf.definition, 'Go to Definition')
    map('n', 'grD', vim.lsp.buf.declaration, 'Go to Declaration')

    -- neovim defaults, set explicitly for reference
    map('n', 'grr', vim.lsp.buf.references, 'Go to References')
    map('n', 'gri', vim.lsp.buf.implementation, 'Go to Implementation')
    map('n', 'grt', vim.lsp.buf.type_definition, 'Go to Type Definition')
    map('n', 'grn', vim.lsp.buf.rename, 'Rename Symbol')
    map({'n','x'}, 'gra', vim.lsp.buf.code_action, 'Code Action')
    map('n', 'gO', vim.lsp.buf.document_symbol, 'Document Symbols')
    map({'i','s'}, '<C-s>', vim.lsp.buf.signature_help, 'Signature Help')

    -- telescope equivalents, opened in a vertical split
    map('n', '<leader>grd', function()
        require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit' })
    end, 'Go to Definition')
    map('n', '<leader>grr', function()
        require('telescope.builtin').lsp_references({ jump_type = 'vsplit' })
    end, 'Go to References')
    map('n', '<leader>gri', function()
        require('telescope.builtin').lsp_implementations({ jump_type = 'vsplit' })
    end, 'Go to Implementation')
    map('n', '<leader>grt', function()
        require('telescope.builtin').lsp_type_definitions({ jump_type = 'vsplit' })
    end, 'Go to Type Definition')

    -- formatting
    map({'n','v'}, '<leader>cf', vim.lsp.buf.format, 'Format')

    -- code action
    map('n', '<leader>ca', function()
        vim.lsp.buf.code_action({ apply = true })
    end, 'Code Action (auto-apply)')
end

function set_diagnostics(enabled)
    vim.diagnostic.config({ virtual_text = enabled, signs = enabled, underline = enabled })
end

setup_lsps()
