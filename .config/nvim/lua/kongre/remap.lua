vim.g.mapleader = " "

-- Open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "Open file explorer" })

-- Adds ability to move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Center screen when half page up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page and center" })

-- Center screen when going through search items
vim.keymap.set("n", "n", "nzzzv", { desc = "Next and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous and center" })

-- Yanking
-- Allow to keep yanked value when pasting
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over selection without yanking" })

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 150 })
	end,
})

-- Toggle between relative and absolute line numbers
vim.keymap.set("n", "<leader>ln", ":set relativenumber!<CR>", { desc = "Toggle line numbers" })

-- Toggle between highlight search and no highlight
vim.keymap.set("n", "<leader>hl", ":set hlsearch!<CR>", { desc = "Toggle search highlight" })

-- Map Ctrl-c to Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

-- Search and replace word under cursor
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Substitute word under cursor" }
)

-- Copy filepath functions
vim.api.nvim_create_user_command("CopyPath", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, { desc = "Copy relative file path to clipboard" })

vim.api.nvim_create_user_command("CopyFullPath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, { desc = "Copy full file path to clipboard" })

-- Copy filepath
vim.keymap.set("n", "<leader>co", ":CopyPath<CR>", { desc = "Copy path to clipboard" })
vim.keymap.set("n", "<leader>cof", ":CopyFullPath<CR>", { desc = "Copy full path to clipboard" })

-- Lua development
-- Run Plenary test file
vim.keymap.set("n", "<leader>t", "<Plug>PlenaryTestFile", { desc = "Run Plenary test file" })
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>", { desc = "Run current Lua file" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>.lua<CR>", { desc = "Run the current Lua line" })
vim.keymap.set("v", "<leader><leader>x", "<cmd>lua<CR>", { desc = "Run the current Lua line" })

-- Switch to alternate file
vim.keymap.set("n", "^", "<C-^>", { desc = "Switch to alternate file" })

-- Execute :Request command
vim.keymap.set("n", "<leader>R", ":Request<CR>", { desc = "Open request.nvim" })
