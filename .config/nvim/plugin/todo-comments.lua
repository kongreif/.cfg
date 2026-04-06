vim.pack.add({
	"https://github.com/folke/todo-comments.nvim",
})

require("todo-comments").setup()

vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Todo telescope" })
vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<CR>", { desc = "Todo quickfix" })
