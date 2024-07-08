# Paths to configuration files
WEZTERM_CONFIG="$HOME/.wezterm.lua"
NVIM_APPEARANCE_CONFIG="$HOME/.config/nvim/after/plugin/appearance.lua"

set_dark_theme_os() {
  if [[ "$(uname)" == "Darwin" ]]; then
    # Dark mode setup for MacOS
    osascript_output=$(osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" 2>&1)
    if [[ $? -eq 0 ]]; then
      echo "MacOS theme changed to dark mode"
    else
      echo "Failed to change MacOS theme to dark mode: $osascript_output"
    fi
  elif [[ "$(uname)" == "Linux" ]]; then
    # Dark mode setup for Linux
    echo "Dark mode setup for Linux is not implemented yet."
  fi
}

set_light_theme_os() {
  if [[ "$(uname)" == "Darwin" ]]; then
    # Light mode setup for MacOS
    osascript_output=$(osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" 2>&1)
    if [[ $? -eq 0 ]]; then
      echo "MacOS theme changed to light mode"
    else
      echo "Failed to change MacOS theme to light mode: $osascript_output"
    fi
  elif [[ "$(uname)" == "Linux" ]]; then
    # Light mode setup for Linux
    echo "Light mode setup for Linux is not implemented yet."
  fi
}

set_light_theme_wezterm() {
  sed -i '' 's/color_scheme = ".*"/color_scheme = "tokyonight_day"/' "$WEZTERM_CONFIG"
  echo "WezTerm theme changed to dark mode"
}

set_dark_theme_wezterm() {
  sed -i '' 's/color_scheme = ".*"/color_scheme = "tokyonight_night"/' "$WEZTERM_CONFIG"
  echo "WezTerm theme changed to dark mode"
}

set_light_theme_nvim() {
  sed -i '' 's/style = ".*"/style = "day"/' "$NVIM_APPEARANCE_CONFIG"
  nvim --headless +"Lazy! sync" +qall >/dev/null 2>&1
  echo "Neovim theme changed to light mode"
}

set_dark_theme_nvim() {
  sed -i '' 's/style = ".*"/style = "night"/' "$NVIM_APPEARANCE_CONFIG"
  nvim --headless +"Lazy! sync" +qall >/dev/null 2>&1
  echo "Neovim theme changed to dark mode"
}

toggle_theme() {
  CURRENT_WEZTERM_THEME=$(grep 'color_scheme = ' "$WEZTERM_CONFIG")
  if [[ "$CURRENT_WEZTERM_THEME" == *"tokyonight_night"* ]]; then
    set_light_theme_os
    set_light_theme_wezterm
    set_light_theme_nvim
  elif [[ "$CURRENT_WEZTERM_THEME" == *"tokyonight_day"* ]]; then 
    set_dark_theme_os
    set_dark_theme_wezterm
    set_dark_theme_nvim
  else
    echo "Current theme not recognized"
  fi
}

toggle_theme
