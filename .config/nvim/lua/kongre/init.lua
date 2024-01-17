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
  -- Plenary is a dependency for other plugins
  "nvim-lua/plenary.nvim",
  "BurntSushi/ripgrep",
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" },
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-tree/nvim-web-devicons",
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
  "nvim-lualine/lualine.nvim",
  { dir = "~/coding/code-palette.nvim" },
  -- completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
  },
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
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        auto_trigger = true,
        key_map = {
          accept = "<C-CR>",
        },
      },
      panel = { enabled = false },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
})

require('lualine').setup()
require('tokyonight').setup({
  style = 'night',
})

require("tokyonight").setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent"
  }
})

require('mini.pairs').setup()
require('mini.comment').setup()
require("ibl").setup()

vim.cmd[[colorscheme tokyonight]]
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})

-- Skip backwards compatibility routines and speed up loading.
vim.g.skip_ts_context_commentstring_module = true

-- TODO: Maybe add nvim-notify
-- TODO: Add which-key.nvim
-- TODO: Add nvim-spectre
-- TODO: Add way to check gitblame
-- TODO: Add formatting via conform.nvim and rubocop (ideally based on .rubocop)
-- TODO: Add linting via nvim-lint
