require("oil").setup()

vim.keymap.set("n", "<C-k>", "<CMD>Oil<CR>", { desc = "Open parent folder" })
