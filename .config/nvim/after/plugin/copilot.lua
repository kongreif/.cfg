require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		key_map = {
			accept = "<C-CR>",
		},
	},
	panel = { enabled = false },
})

vim.api.nvim_set_keymap(
	"n",
	"<Leader>cp",
	":lua require('copilot.suggestion').toggle_auto_trigger()<CR>",
	{ noremap = true, silent = true }
)
