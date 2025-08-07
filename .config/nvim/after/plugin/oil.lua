require("oil").setup()

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent folder" })
