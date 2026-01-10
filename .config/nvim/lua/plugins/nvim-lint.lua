return {
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				ruby = { "rubocop" },
				vue = { "eslint" },
				typescript = { "eslint" },
				javascript = { "eslint" },
				go = { "golangci_lint" },
				lua = { "luacheck" },
			},
		},
		config = function(_, opts)
			local lint = require("lint")

			if opts.linters_by_ft then
				lint.linters_by_ft = opts.linters_by_ft
			end

			local original_eslint_parser = lint.linters.eslint.parser

			lint.linters.eslint.parser = function(output, bufnr)
				local start = output:find("[%[]")
				if start then
					output = output:sub(start)
				end
				return original_eslint_parser(output, bufnr)
			end

			if vim.fn.executable("rubocop") ~= 1 then
				lint.linters_by_ft.ruby = {}
			else
				if lint.linters.rubocop then
					lint.linters.rubocop.cmd = { "bundle", "exec", "rubocop" }
				end
			end

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
