vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters = {
		rubocop = {
			command = "bundle",
			prepend_args = { "exec", "rubocop" },
		},
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
	format_on_save = { lsp_fallback = true },
})
