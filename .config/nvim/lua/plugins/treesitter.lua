return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
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
				prefer_git = true,
				disable_runtime_parsers = true,
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
	},
}
