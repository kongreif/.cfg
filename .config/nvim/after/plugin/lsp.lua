local lspconfig = require("lspconfig")

lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		typescript = {
			tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
		},
	},
})

lspconfig.jsonls.setup({})
