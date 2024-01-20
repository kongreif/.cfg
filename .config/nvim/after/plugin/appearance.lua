require("lualine").setup()

require("tokyonight").setup({
	transparent = true,
	style = "night",
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})

vim.cmd([[colorscheme tokyonight]])
