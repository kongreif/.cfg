require("mason").setup()
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("jsonls", {
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

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("ruby_lsp", {
	capabilities = capabilities,
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			gofumpt = true, -- prefer stricter formatting
			usePlaceholders = true,
			analyses = { unusedparams = true, nilness = true, shadow = true },
			staticcheck = true,
		},
	},
})

vim.lsp.enable({ "gopls", "lua_ls", "jsonls", "ruby_lsp" })
