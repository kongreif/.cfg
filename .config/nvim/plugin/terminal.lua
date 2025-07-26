vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local job_id = 0
local buffer = -1
local window = -1

vim.keymap.set("n", "<leader>m", function()
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
	end

	job_id = vim.bo.channel
end)

vim.keymap.set("n", "<leader>rs", function()
	vim.fn.chansend(job_id, { "echo 'hi'\r\n" })
end)
