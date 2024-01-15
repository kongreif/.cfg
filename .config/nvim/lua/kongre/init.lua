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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  "nvim-lua/plenary.nvim",
  "BurntSushi/ripgrep",
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" },
  "nvim-treesitter/nvim-treesitter",
  "mbbill/undotree",
  "theprimeagen/harpoon",
  {
    'jakewvincent/mkdnflow.nvim',
    config = function()
      require('mkdnflow').setup({
        perspective = {
          priority = 'root',
          root_tell = 'index.md'
        }
      })
    end
  },
  {
   "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = {
   },
  },
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
  "github/copilot.vim",
})

require('lualine').setup()
require('tokyonight').setup({
  style = 'night',
})

require("tokyonight").setup({
  transparent = true,
  styles = {
    sidebars = "dark",
    floats = "dark"
  }
})

vim.cmd[[colorscheme tokyonight]]
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
