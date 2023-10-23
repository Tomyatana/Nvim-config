local lsp_zero = require('lsp-zero')
local mason = require('mason')
local lspconfig = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
}

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim'}
            }
        }
    }
})
require'lspconfig'.pyright.setup{}

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true}),
    }
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
