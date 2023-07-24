-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('navarasu/onedark.nvim')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  use('theprimeagen/harpoon')
  use('tpope/vim-fugitive')
  use('tpope/vim-rails')
  use('vim-test/vim-test')
  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-compe')
  use('hrsh7th/vim-vsnip')
  use {
      'neoclide/coc.nvim', branch = 'release'
  }
  use('yaegassy/coc-volar')
  use('yaegassy/coc-volar-tools')
  use('github/copilot.vim')
  use('navarasu/onedark.nvim')
end)

