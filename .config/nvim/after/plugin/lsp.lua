require("mason").setup()
local lspconfig = require("lspconfig")

lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		typescript = {
			tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
		},
		vue = {
			hybridMode = false,
		},
	},
})

lspconfig.jsonls.setup({})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.ruby_lsp.setup({})
