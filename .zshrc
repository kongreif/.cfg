# Loads version control into prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f'

# Dotfiles via git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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

# Add further directories to path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# OS based setup
if [[ "$(uname -s)" == "Darwin" ]]; then
  # Chruby setup for MacOS
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
elif [[ "$(uname -s)" == "Linux" ]]; then
fi

# Work related setup
if [[ "$(hostname)" == "DG097MAC.fritz.box" ]];then
  export PATH=$HOME/coding/dev/bin:$PATH
  eval "$(shadowenv init zsh)"
fi
