local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

--require("neodev").setup()

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
require'lspconfig'.clangd.setup{
    cmd = { 'clangd', '--background-index' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_dir = function ()
        return vim.fn.getcwd()
    end
}

local notify = require 'notify'
vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local lvl = ({
    'ERROR',
    'WARN',
    'INFO',
    'DEBUG',
  })[result.type]
  notify({ result.message }, lvl, {
    title = 'LSP | ' .. client.name,
    timeout = 10000,
    keep = function()
      return lvl == 'ERROR' or lvl == 'WARN'
    end,
  })
end

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true}),
    },
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
