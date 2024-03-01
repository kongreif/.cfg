require("mini.comment").setup()
require("ibl").setup()

-- Keymaps for todo-comments.nvim
vim.api.nvim_set_keymap("n", "<leader>tt", ":TodoTelescope<CR>", { noremap = true, silent = true })

-- Skip backwards compatibility routines and speed up loading of comment string
vim.g.skip_ts_context_commentstring_module = true
