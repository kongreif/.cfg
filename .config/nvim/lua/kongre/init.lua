require("kongre.remap")
require("kongre.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({})
    vim.cmd('colorscheme github_dark')
  end,
  },
  "nvim-lua/plenary.nvim",
  "BurntSushi/ripgrep",
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" },
  "nvim-treesitter/nvim-treesitter",
  "mbbill/undotree",
  "theprimeagen/harpoon",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rails",
  "vim-test/vim-test",
  "hrsh7th/nvim-compe",
  "hrsh7th/vim-vsnip",
  { "neoclide/coc.nvim", branch = "release" },
  "yaegassy/coc-volar",
  "yaegassy/coc-volar-tools",
  "github/copilot.vim"
})

require('lualine').setup()

