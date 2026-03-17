return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master", -- Pin to old stable API (required for Neovim < 0.12)
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"css",
					"gitignore",
					"go",
					"json",
					"jsonc",
					"lua",
					"markdown",
					"markdown_inline",
					"ruby",
					"typescript",
					"vue",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "master", -- Pin for compatibility with Neovim < 0.12
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		branch = "master", -- Pin for compatibility with Neovim < 0.12
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
	},
}
