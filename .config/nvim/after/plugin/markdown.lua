require("mkdnflow").setup({
	perspective = {
		priority = "root",
		root_tell = "index.md",
	},
})

-- Make sure that md files are saved, e.g. when navigating to different files
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "md" },
	callback = function()
		vim.keymap.set("i", "<CR>", "<Cmd>:MkdnNewListItem<CR>", { buffer = true, noremap = true, silent = true })
	end,
})
