vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	completion = { documentation = { auto_show = true } },
})

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})
