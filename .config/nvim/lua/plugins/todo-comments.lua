return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		keys = {
			{ "<leader>tt", ":TodoTelescope<CR>", desc = "Todo telescope", noremap = true, silent = true },
			{ "<leader>tq", ":TodoQuickFix<CR>", desc = "Todo quickfix", noremap = true, silent = true },
		},
	},
}
