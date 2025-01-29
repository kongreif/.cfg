#!/bin/bash
DOTFILES="$HOME/.cfg"

# Check if yay is installed
if ! command -v yay &> /dev/null; then
	echo "yay is not installed. install it first :)"
	exit 1
fi

# Checks whether a package is installed. If not installs it.
check_and_install() {
	local package="$1"
	if ! yay -Q "$package" &> /dev/null; then
		echo "$package is not installed. Installing ..."
		yay -S --noconfirm "$package"
	else
		echo "$package is already installed."
	fi
}

# terminal emulator
check_and_install "wezterm"
# neovim and dependencies
check_and_install "ripgrep"
check_and_install "xclip"
check_and_install "neovim"
# zsh
check_and_install "zsh"

# Set zsh as default shell
if [ "$SHELL" != "/bin/zsh"]; then
	echo "Setting zsh as default shell."
	chsh -s $(which zsh)
fi

# Check whether oh-my-zsh is installed:

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing..."
    # Save current .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
        mv "$HOME/.zshrc" "$HOME/.zshrc.pre-oh-my-zsh"
    fi

    # Install Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Remove the default .zshrc created by Oh My Zsh if it exists
    if [ -f "$HOME/.zshrc" ]; then
        rm "$HOME/.zshrc"
    fi
else
    echo "Oh My Zsh is already installed"
fi
