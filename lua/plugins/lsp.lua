return {
    {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {
        'hrsh7th/nvim-cmp',
        event = { "InsertEnter", "CmdlineEnter" },
    },
    {'crazyhulk/cmp-sign'},
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-path' },
    { 'williamboman/mason.nvim' },
    {'williamboman/mason-lspconfig.nvim'},
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    }
}
