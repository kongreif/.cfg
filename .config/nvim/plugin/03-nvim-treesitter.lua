vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({
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
