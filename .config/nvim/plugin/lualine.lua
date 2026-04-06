vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					if str:find("-") then
						return str:sub(1, 3)
					else
						return str:sub(1, 1)
					end
				end,
			},
		},
		lualine_b = {
			{
				"branch",
				fmt = function(str)
					return str:sub(1, 15)
				end,
			},
			"diff",
			"diagnostics",
		},
	},
})
