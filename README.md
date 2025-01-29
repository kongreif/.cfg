These are my personal dotfiles.
I'm using [Wezterm](https://wezfurlong.org/wezterm/index.html) as a terminal emulator and [Neovim](https://neovim.io/) as a text editor.
My dotfiles live in a bare git repository with `$HOME` as the worktree. It's inspired by [this blog article](https://www.atlassian.com/git/tutorials/dotfiles).

## Install instructions MacOS
### General
1. Install wezterm
E.g.
```
yay wezterm
```
2. Install OhmyZSH
[Official install guide](https://ohmyz.sh/#install)

3. Install nvim
E.g.
```
yay neovim
```

4. Set default shell to ZSH
Install ZSH
```
yay zsh
```
Set default shell for your user
```
chsh -s /bin/zsh
```


5. Ignore .cfg in .gitignore
```
touch ~/.gitignore
echo ".cfg" >> ~/.gitignore
```

6. Clone repo
After setting up SSH for github, clone the repo as `--bare`:
```
git clone --bare git@github.com:kongreif/.cfg.git $HOME/.cfg
```
Then set alias for current shell scope.
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
Checkout the actual content from the bare repository to your $HOME:
```
config checkout
```
If above fails, move / delete .zshrc and run again.


7. Set showUntrackedFiles to no
Set the flag showUntrackedFiles to no on this specific (local) repository:
```
config config --local status.showUntrackedFiles no
```
Now you can run git commands for the config like:
```
config status
config add .filename
config commit -m "Add filename"
config push
```
8. Setup nvim
In order for telescope to work, you'll need to install ripgrep

```
yay ripgrep
```

## Install instructions Arch Linux

1. `git clone git@github.com:kongrei/.cfg.git`
1. `cd .cfg`
1. `chmod +x arch-linux-install.sh`
1. `chmod +x arch-linux-install.sh`

## Rails dev related setup
1. Install ruby
Install ruby-install
```
yay ruby-install
```

Install chruby
```
yay chruby
```
Run ruby-install
```
ruby-install
```
Then install desired ruby version, e.g.
```
ruby-install 3.3.3
```

2. Install PostgreSQL
```
yay postgresql
```
Initialize PostgreSQL database cluster:
```
sudo su - postgres -c "initdb --locale en_US.UTF-8 -D /var/lib/postgres/data"
```
Start the PostgreSQL service and enable it to start on boot:
```
sudo systemctl start postgresql
sudo systemctl enable postgresql
```
