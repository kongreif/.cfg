return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>a",
			function()
				harpoon:list():add()
			end,
			desc = "Harpoon: Add file",
		},
		{
			"<C-e>",
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon: Show menu",
		},
		{
			"<C-1>",
			function()
				harpoon:list():select(1)
			end,
			desc = "Harpoon: Select 1st file",
		},
		{
			"<C-2>",
			function()
				harpoon:list():select(2)
			end,
			desc = "Harpoon: Select 2nd file",
		},
		{
			"<C-3>",
			function()
				harpoon:list():select(3)
			end,
			desc = "Harpoon: Select 3rd file",
		},
		{
			"<C-4>",
			function()
				harpoon:list():select(4)
			end,
			desc = "Harpoon: Select 3rd file",
		},
	},
}
