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

-- Color scheme
config.color_scheme = 'tokyonight_night'

-- Disable close confirmaion
config.window_close_confirmation = 'NeverPrompt'

-- Disable close tab confirmation
config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
}

-- Background image
if wezterm.target_triple:find("darwin") then
  -- macOS path
  background_image_path = "/Users/konnislove/wezterm_background/mount_fuji.jpg"
else
  -- Linux path
  background_image_path = "/home/kon/wezterm_background/mount_fuji.jpg"
end

config.background = {
  {
    source = {
      File = background_image_path
    },
    hsb = {
      saturation = 1.0,
      brightness = 0.01
    },
    horizontal_align = 'Center',
    vertical_align = 'Middle'
  }
}

-- return the configuration to wezterm
return config
