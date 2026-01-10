return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		keymap = { preset = "default" },
		completion = { documentation = { auto_show = true } },
	},
	opts_extend = { "sources.default" },
}
