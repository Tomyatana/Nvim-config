local lspconfig = require('lspconfig')
local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
---@diagnostic disable-next-line: unused-local
local lsp_attach = function(client, bufnr)
    local opts = {
        buffer = bufnr,
    }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- none-ls

local null_ls = require('null-ls')

null_ls.setup {
    sources = {
        null_ls.builtins.diagnostics.mypy
    }
}

require('mason-null-ls').setup {
    ensure_installed = {},
    automatic_installation = false
}

-- mason

local mason_lspconfig = require('mason-lspconfig')

require('mason').setup({})
mason_lspconfig.setup({
    ensure_installed = { 'clangd', 'rust_analyzer', 'lua_ls' },
})

mason_lspconfig.setup_handlers({
    function (server_name)
        lspconfig[server_name].setup({})
    end,
})

-- cmp

local cmp = require('cmp')

cmp.setup {
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
            { name = "buffer" },
        }
    ),
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        ['<C-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end),
        ['<C-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end),
    },
}
