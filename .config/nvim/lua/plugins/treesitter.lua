return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
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
}
