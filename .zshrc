# Loads version control into prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f'

# Dotfiles via git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Switch theme
alias toggletheme='~/.toggle-theme.sh'

# Nvim remaps
alias vi='nvim'
alias vim='nvim'
alias vic='cd ~/.config/nvim/ && vi .'

# Git remaps
alias ga='git add'
alias gc='git commit -v'
alias gp='git push'
alias gst='git status'
alias gsw='git switch'
alias gswc='git switch -c'
alias gswm='git switch main'

# Rails remaps
alias be='bundle exec'

# Unix remaps
alias la='ls -la --color=auto'

# Quality of life remaps
alias ppm='cd ~/coding/privacy-partner-management'
alias cr='cd ~/coding/contract-review'

# Add further directories to path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/go/bin"

# OS based setup
if [[ "$(uname -s)" == "Darwin" ]]; then
  # Chruby setup for MacOS
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.3.0

  # pnpm path
  export PNPM_HOME="/Users/kontantingreif/Library/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
elif [[ "$(uname -s)" == "Linux" ]]; then
  # Chruby setup for Linux
  source /usr/share/chruby/chruby.sh
  source /usr/share/chruby/auto.sh
  chruby ruby-3.3.0

  # pnpm path
  export PNPM_HOME="/home/kon/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
  export PATH="/home/kon/.local/share/pnpm/global/5/node_modules:$PATH"
fi

# Work related setup
if [[ "$(hostname)" == *DG097MAC* ]];then
  export PATH=$HOME/coding/dev/bin:$PATH
  eval "$(shadowenv init zsh)"
fi

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
