local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope files" })
vim.keymap.set("n", "<leader>pgf", builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set("n", "<leader>pgc", builtin.git_commits, { desc = "Telescope git commits" })
vim.keymap.set("n", "<leader>pw", builtin.grep_string, { desc = "Telescope string under cursor" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>pht", builtin.help_tags, { desc = "Telescope help_tags" })
vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "Telescope keymaps" })
vim.keymap.set("n", "<leader>pn", function()
	builtin.find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Telescope vim config" })

require("telescope").setup({
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})
