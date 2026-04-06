vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "telescope-fzf-native.nvim" then
			vim.fn.system({ "make", "-C", ev.data.path })
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})
