return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		opts = {
			pickers = {
				find_files = { find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } },
			},
			extensions = { fzf = {} },
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
		end,
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope files",
			},
			{
				"<leader>fgf",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Telescope git files",
			},
			{
				"<leader>fgc",
				function()
					require("telescope.builtin").git_commits()
				end,
				desc = "Telescope git commits",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Telescope string under cursor",
			},
			{
				"<leader>fs",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Telescope grep",
			},
			{
				"<leader>fd",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Telescope diagnostics",
			},
			{
				"<leader>fht",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Telescope help_tags",
			},
			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Telescope keymaps",
			},
			{
				"<leader>fn",
				function()
					require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Telescope vim config",
			},
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({
						cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
					})
				end,
				desc = "Telescope package files",
			},
			{
				"<leader>fr",
				function()
					require("config.telescope.filtergrep").live_filtergrep()
				end,
				desc = "Telescope grep with filter",
			},
		},
	},
}
