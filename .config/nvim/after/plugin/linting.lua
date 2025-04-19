local lint = require("lint")
lint.linters_by_ft = {
	ruby = { "bundle exec rubocop" },
	vue = { "eslint" },
	typescript = { "eslint" },
	javascript = { "eslint" },
}

if vim.fn.executable("rubocop") == 1 then
	lint.linters_by_ft.ruby = { "rubocop" }
else
	lint.linters_by_ft.ruby = {}
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
