vim.pack.add({
	"https://github.com/jakewvincent/mkdnflow.nvim",
})

require("mkdnflow").setup({
	perspective = {
		priority = "root",
		root_tell = "index.md",
	},
})
