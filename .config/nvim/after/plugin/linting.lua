local lint = require("lint")
lint.linters_by_ft = {
	ruby = { "bundle exec rubocop" },
	vue = { "eslint" },
	typescript = { "eslint" },
	javascript = { "eslint" },
	go = { "golangcilint" },
}

local original_eslint_parser = lint.linters.eslint.parser

-- Replace the parser with a wrapper that strips leading logs
lint.linters.eslint.parser = function(output, bufnr)
  -- Find where the JSON actually starts
  local start = output:find("[%[]")
  if start then
    output = output:sub(start)
  end
  return original_eslint_parser(output, bufnr)
end

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
