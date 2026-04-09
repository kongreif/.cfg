vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
})

local lint = require("lint")

local rubocop = lint.linters.rubocop
rubocop.cmd = "bundle"
rubocop.args = vim.list_extend({ "exec", "rubocop" }, rubocop.args)

lint.linters_by_ft = {
	ruby = { "rubocop" },
	vue = { "eslint" },
	typescript = { "eslint" },
	javascript = { "eslint" },
	go = { "golangci_lint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})
