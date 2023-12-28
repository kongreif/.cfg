-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Multiplexer module
local mux = wezterm.mux

-- Action module
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

-- For example, changing the color scheme:
config.color_scheme = 'tokyonight_night'

-- and finally, return the configuration to wezterm
return config
