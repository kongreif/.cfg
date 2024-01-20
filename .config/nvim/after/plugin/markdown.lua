require("mkdnflow").setup({
	perspective = {
		priority = "root",
		root_tell = "index.md",
	},
})

-- Make sure that md files are saved, e.g. when navigating to different files
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
