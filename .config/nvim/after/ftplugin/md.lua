-- Autocommands for Markdown files
vim.api.nvim_create_augroup("Markdown", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "Markdown",
	pattern = { "markdown", "md" },
	callback = function()
		-- Enable visual wrapping at the window edge
		vim.wo.wrap = true -- Enable wrapping
		vim.wo.linebreak = true -- Wrap lines at word boundaries
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "md" },
	callback = function()
		vim.keymap.set("i", "<CR>", "<Cmd>:MkdnNewListItem<CR>", { buffer = true, noremap = true, silent = true })
	end,
})

-- Reset settings for non-Markdown files
vim.api.nvim_create_autocmd("FileType", {
	group = "Markdown",
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "md" then
			-- Disable wrapping for non-Markdown files
			vim.wo.wrap = false
			vim.wo.linebreak = false
		end
	end,
})

-- Make sure that md files are saved, e.g. when navigating to different files
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
