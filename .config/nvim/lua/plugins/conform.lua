return {
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				lsp_fallback = true,
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				ruby = { "rubocop" },
				lua = { "stylua" },
				vue = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				go = { "gofumpt" },
			},
		},
	},
}
