local wezterm = require("wezterm")

-- Multiplexer module
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Format tab title to contain the path's directory and current process
wezterm.on("format-tab-title", function(tab)
	local cwd_uri = tab.active_pane.current_working_dir.path or ""
	cwd_uri = cwd_uri:match("([^/]+)$") or ""

	local process = tab.active_pane.foreground_process_name or ""
	process = process:match("[^/\\]+$") -- strip any path
	if process == "" then
		process = tab.active_pane.title or ""
	end

	return string.format("%d: %s | %s", tab.tab_index + 1, cwd_uri, process)
end)

-- This is where you actually apply your config choices
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- Color scheme
config.color_scheme = "tokyonight_night"

-- Disable close confirmaion
config.window_close_confirmation = "NeverPrompt"

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
		}),
	},
	{
		key = "t",
		mods = "ALT|SHIFT",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		key = "p",
		mods = "ALT",
		action = wezterm.action.SendString("pro\n"),
	},
	{
		key = "o",
		mods = "ALT",
		action = wezterm.action.SendString("glo\n"),
	},

	{
		key = "<",
		mods = "LEADER|SHIFT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = ">",
		mods = "LEADER|SHIFT",
		action = wezterm.action.MoveTabRelative(1),
	},

	-- multiplexing commands
	-- opening / closing panes
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "X",
		mods = "LEADER|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	-- navigating through panes
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
}

-- return the configuration to wezterm
return config
