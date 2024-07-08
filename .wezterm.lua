-- Pull in the wezterm API
local wezterm = require("wezterm")

local username = os.getenv("USER") or os.getenv("USERNAME")

-- Multiplexer module
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- Color scheme
config.color_scheme = "tokyonight_night"

-- Disable close confirmaion
config.window_close_confirmation = "NeverPrompt"

-- Disable close tab confirmation
config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
		}),
	},
	{
		key = "t",
		mods = "CMD|SHIFT",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
}

-- return the configuration to wezterm
return config
