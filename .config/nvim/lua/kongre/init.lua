require("kongre.remap")
require("kongre.set")
require("kongre.globals")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
	spec = {
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},
		-- Plenary is a dependency for other plugins
		"nvim-lua/plenary.nvim",

		-- navigation
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
				},
			},
		},
		"BurntSushi/ripgrep",
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-tree/nvim-web-devicons",
		"mbbill/undotree",
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		"nvim-lualine/lualine.nvim",
		{
			"stevearc/oil.nvim",
			opts = {},
		},

		-- completion
		{
			"saghen/blink.cmp",
			version = "*",
			dependencies = {
				"rafamadriz/friendly-snippets", -- you already have this via LuaSnip deps
			},
			opts = {
				-- keep it minimal; Blink ships good defaults
				snippets = { preset = "luasnip" }, -- integrate with LuaSnip
				sources = { default = { "lsp", "path", "buffer", "snippets" } },
				completion = {
					list = {
						selection = {
							preselect = false,
							auto_insert = true,
						},
					},
					documentation = {
						auto_show = true,
					},
				},
				keymap = {
					preset = "default",
					["<CR>"] = { "accept", "fallback" },
				},
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

		-- LSP
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				{
					"folke/lazydev.nvim",
					ft = "lua", -- only load on lua files
					opts = {
						library = {
							{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
						},
					},
				},
			},
		},
		{
			"williamboman/mason.nvim",
		},

		-- Linting
		"mfussenegger/nvim-lint",

		-- Formatting
		"stevearc/conform.nvim",

		-- Testing
		{
			"nvim-neotest/neotest",
			dependencies = {
				"nvim-lua/plenary.nvim",
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

		-- neovim development
		-- TODO

		-- markdown and writing
		"jakewvincent/mkdnflow.nvim",

		-- Plugins in development
		{
			"kongreif/request.nvim",
			dev = false,
			config = function()
				require("request")
			end,
		},
	},
	checker = { enabled = false },
	dev = {
		path = "~/code/neovim-plugins/",
	},
})

-- Autocommands for specific filetypes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.jbuilder",
	command = "set filetype=ruby",
})

-- TODO: Add nvim-spectre
