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

-- Attempt to use the project-specific 'ruby-lsp' if available
local function get_ruby_lsp_command()
	local is_bundled = vim.fn.glob("Gemfile") ~= ""
	if is_bundled then
		return "bundle exec ruby-lsp"
	else
		return "ruby-lsp"
	end
end

lspconfig.ruby_lsp.setup({
	cmd = { get_ruby_lsp_command(), "stdio" },
	filetypes = { "ruby" },
	root_dir = lspconfig.util.root_pattern(".git", "Gemfile"),
	init_options = {
		formatter = "rubocop",
		linters = { "rubocop" },
	},
	settings = {
		ruby = {
			formatting = {
				enabled = true,
			},
			linting = {
				enabled = true,
				linters = { "rubocop" },
			},
		},
	},
})
