require("conform").setup({
	formatters_by_ft = {
		ruby = { "rubocop" },
		lua = { "stylua" },
		vue = { "prettier" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.bufnr })
	end,
})
