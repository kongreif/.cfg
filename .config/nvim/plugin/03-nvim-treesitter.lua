vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

local ensure_installed = {
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
}

require("nvim-treesitter").setup({
	ensure_installed = ensure_installed,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = ensure_installed,
	callback = function()
		vim.treesitter.start()
	end,
})
