vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

--adds ability to move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--center screen when half page up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--center screen when going through search items
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--allow to keep yanked value when pasting
vim.keymap.set("x", "<leader>p", '"_dP')

--yank to clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

--toggle between relative and absolute line numbers
vim.keymap.set("n", "<leader>ln", ":set relativenumber!<CR>")

--toggle between highlight search and no highlight
vim.keymap.set("n", "<leader>hl", ":set hlsearch!<CR>")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("Cppathand", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.keymap.set("n", "<leader>t", "<Plug>PlenaryTestFile")
vim.keymap.set("n", "^", "<C-^>")

vim.keymap.set("n", "<leader>r", ":Request<CR>")
