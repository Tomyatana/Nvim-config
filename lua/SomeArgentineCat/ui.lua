vim.opt.termguicolors = true

require('catppuccin').setup({
    flavour = "macchato",
    integrations = {
        cmp = true,
        treesitter = true,
    },
    styles = { variables = {"italic"}},
    color_overrides = { all = { text = "#ffbaba"}}
})

require('lualine').setup({
    options = {
        theme = 'catppuccin',
    }
})

vim.cmd('colorscheme catppuccin-mocha')

vim.notify = require('notify')
