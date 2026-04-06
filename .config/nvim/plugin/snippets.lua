vim.pack.add({
	"https://github.com/L3MON4D3/LuaSnip",
})

require("luasnip").setup({
	history = true,
	delete_check_events = "TextChanged",
})

require("luasnip.loaders.from_vscode").lazy_load()
