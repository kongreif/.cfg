vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

local schemastore = require("schemastore")

vim.lsp.config("jsonls", {
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			schemas = schemastore.json.schemas(),
			validate = { enable = true },
			format = { enable = false },
		},
	},
})

vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths
					-- here.
					-- '${3rd}/luv/library'
					-- '${3rd}/busted/library'
				},
				-- Or pull in all of 'runtimepath'.
				-- NOTE: this is a lot slower and will cause issues when working on
				-- your own configuration.
				-- See https://github.com/neovim/nvim-lspconfig/issues/3189
				-- library = {
				--   vim.api.nvim_get_runtime_file('', true),
				-- }
			},
		})
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "P" },
			},
		},
	},
})

vim.lsp.config("ruby_lsp", {})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			gofumpt = true,
			usePlaceholders = true,
			analyses = { unusedparams = true, nilness = true, shadow = true },
			staticcheck = true,
		},
	},
})

vim.lsp.enable({ "gopls", "lua_ls", "jsonls", "ruby_lsp" })
