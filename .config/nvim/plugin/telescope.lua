vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({
	pickers = {
		find_files = { find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } },
	},
	extensions = { fzf = {} },
})

require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope files" })
vim.keymap.set("n", "<leader>fgf", builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "Telescope git commits" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope string under cursor" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>fht", builtin.help_tags, { desc = "Telescope help_tags" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })
vim.keymap.set("n", "<leader>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Telescope vim config" })
vim.keymap.set("n", "<leader>fp", function()
	builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "pack") })
end, { desc = "Telescope package files" })
vim.keymap.set("n", "<leader>fr", function()
	require("config.telescope.filtergrep").live_filtergrep()
end, { desc = "Telescope grep with filter" })
