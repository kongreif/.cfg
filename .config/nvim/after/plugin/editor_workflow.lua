require("mini.comment").setup()
require("ibl").setup()
require("gitblame").setup({
	enabled = false,
})

-- Keymaps for todo-comments.nvim
vim.api.nvim_set_keymap(
	"n",
	"<leader>tt",
	":TodoTelescope<CR>",
	{ desc = "Todo telescope", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>tq",
	":TodoQuickFix<CR>",
	{ desc = "Todo quickfix", noremap = true, silent = true }
)

-- Skip backwards compatibility routines and speed up loading of comment string
vim.g.skip_ts_context_commentstring_module = true
