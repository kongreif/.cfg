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
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/nvim-treesitter-context",
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
   -- TODO: Add keymaps and workflow for uses
  },
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rails",
  "vim-test/vim-test",
  "hrsh7th/nvim-compe",
  "hrsh7th/vim-vsnip",
  { "neoclide/coc.nvim", branch = "release" },
  { 'echasnovski/mini.pairs', version = false },
  { 'echasnovski/mini.comment', version = false },
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
    -- TODO: Add keymaps for showing in current opened project
  },
  "yaegassy/coc-volar",
  "yaegassy/coc-volar-tools",
  "github/copilot.vim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
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

require('mini.pairs').setup()
require('mini.comment').setup()
require("ibl").setup()

vim.cmd[[colorscheme tokyonight]]
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})

-- Skip backwards compatibility routines and speed up loading.
vim.g.skip_ts_context_commentstring_module = true

-- TODO: Add indent-blankline.nvim
-- TODO: Maybe add nvim-notify
-- TODO: Add which-key.nvim
-- TODO: Add snippets via LuaSnip, friendliy-snippets, 
-- TODO: Add full completion support with nvim-cmp, cmp-nvim-lsp, cmp-buffer, cmp-path, cmp_luasnip
-- TODO: Add nvim-spectre
-- TODO: Add way to check gitblame
-- TODO: Remove unnecessary testing and git packages
-- TODO: Add formatting via conform.nvim and rubocop (ideally based on .rubocop)
-- TODO: Add linting via nvim-lint
