require("kongre.remap")
require("kongre.set")
require("kongre.globals")

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

	-- navigation
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	"BurntSushi/ripgrep",
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-tree/nvim-web-devicons",
	"mbbill/undotree",
	"theprimeagen/harpoon",
	"nvim-lualine/lualine.nvim",

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
		},
	},

	-- editor workflow
	{ "echasnovski/mini.comment", version = false },
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	"f-person/git-blame.nvim",

	-- Github copilot integraion
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
	},

	-- LSP
	"neovim/nvim-lspconfig",

	-- Linting
	"mfussenegger/nvim-lint",

	-- Formatting
	"stevearc/conform.nvim",

	-- Testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"olimorris/neotest-rspec",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rspec"),
				},
			})
		end,
	},
	{ "nvim-neotest/nvim-nio" },

	-- Measure nvim startup time via :StartupTime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- markdown and writing
	"jakewvincent/mkdnflow.nvim",

	-- Plugins in development
	{
    "kongreif/request.nvim", dev = true,
    config = function()
      require('request')
    end,
  },
}, {
	dev = {
		path = "~/coding/neovim-plugins/",
	},
})

-- Autocommands for specific filetypes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.jbuilder",
	command = "set filetype=ruby",
})

-- TODO: Add nvim-spectre
