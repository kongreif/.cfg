require("mason").setup()
local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

lspconfig.jsonls.setup({
	capabilities = capabilities,
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
			format = { enable = false },
		},
	},
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.ruby_lsp.setup({
	capabilities = capabilities,
})
