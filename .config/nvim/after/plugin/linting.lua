require("lint").linters_by_ft = {
	ruby = { "rubocop" },
	vue = { "eslint" },
	typescript = { "eslint" },
	javascript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
