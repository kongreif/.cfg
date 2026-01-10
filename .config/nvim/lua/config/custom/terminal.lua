vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local channel_id = 0
local buffer = -1
local window = -1

local toggle_terminal = function()
	if vim.api.nvim_buf_is_valid(buffer) then
		if vim.api.nvim_win_is_valid(window) then
			if vim.api.nvim_get_current_win() == window then
				vim.api.nvim_win_close(window, false)
			else
				vim.api.nvim_set_current_win(window)
			end
		else
			window = vim.api.nvim_open_win(buffer, false, { split = "below" })
			vim.api.nvim_set_current_win(window)
			vim.cmd.wincmd("J")
			vim.api.nvim_win_set_height(0, 10)
		end
	else
		vim.cmd.new()
		vim.cmd.term()
		vim.cmd.wincmd("J")
		vim.api.nvim_win_set_height(0, 10)
		buffer = vim.api.nvim_get_current_buf()
		window = vim.api.nvim_get_current_win()
		channel_id = vim.bo.channel
	end
end

local open_or_switch_to_terminal = function()
	if vim.api.nvim_buf_is_valid(buffer) then
		if vim.api.nvim_win_is_valid(window) then
			if vim.api.nvim_get_current_win() ~= window then
				vim.api.nvim_set_current_win(window)
			end
		else
			window = vim.api.nvim_open_win(buffer, false, { split = "below" })
			vim.api.nvim_set_current_win(window)
			vim.cmd.wincmd("J")
			vim.api.nvim_win_set_height(0, 10)
		end
	else
		vim.cmd.new()
		vim.cmd.term()
		vim.cmd.wincmd("J")
		vim.api.nvim_win_set_height(0, 10)
		buffer = vim.api.nvim_get_current_buf()
		window = vim.api.nvim_get_current_win()
		channel_id = vim.bo.channel
	end
end

vim.keymap.set("n", "<leader>m", toggle_terminal, { desc = "Terminal toggle" })

vim.keymap.set("n", "<leader>rs", function()
	open_or_switch_to_terminal()
	vim.fn.chansend(channel_id, { "bundle exec rspec\r\n" })
end, { desc = "Terminal rspec" })
