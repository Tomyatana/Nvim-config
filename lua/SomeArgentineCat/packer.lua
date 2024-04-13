-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- LSP
  use {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'}
  use
  {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim'
  }
  use 'neovim/nvim-lspconfig'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'

  use 'folke/neodev.nvim'
  use 'hrsh7th/cmp-nvim-lua'

  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use { 'preservim/nerdtree' }

  use { 'ap/vim-buftabline' }

  use {
    "catppuccin/nvim", as = "catppuccin"
  }

  use("nvim-tree/nvim-web-devicons")

  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
  use ('nvim-treesitter/playground')

  use('mbbill/undotree')

  use ('ryanoasis/vim-devicons')

  use ('rcarriga/nvim-notify')

end)
