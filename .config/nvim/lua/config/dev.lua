-- Plugins under active development.
-- Uncomment a line to override the stable pack/start/ version
-- with your local copy. Comment it out to switch back.
local dev_plugins = {
	["request"] = "~/code/request.nvim",
}

for _, path in pairs(dev_plugins) do
	vim.opt.runtimepath:prepend(vim.fn.expand(path))
end

-- Reload all modules matching a plugin's top-level namespace
local function reload_dev_plugin(name)
	local count = 0
	for mod, _ in pairs(package.loaded) do
		if mod == name or mod:sub(1, #name + 1) == name .. "." then
			package.loaded[mod] = nil
			count = count + 1
		end
	end
	require(name)
	vim.notify(("Reloaded %s (%d modules)"):format(name, count))
end

vim.api.nvim_create_user_command("ReloadDevPlugins", function(opts)
	reload_dev_plugin(opts.args)
end, {
	nargs = 1,
	complete = function()
		return vim.tbl_keys(dev_plugins)
	end,
})

vim.keymap.set("n", "<leader>rl", function()
	local names = vim.tbl_keys(dev_plugins)
	if #names == 0 then
		vim.notify("No dev plugins configured", vim.log.levels.WARN)
		return
	end
	for _, name in ipairs(names) do
		reload_dev_plugin(name)
	end
end, { desc = "Reload dev plugin" })
