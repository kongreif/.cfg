These are my personal dotfiles.
I'm using [Wezterm](https://wezfurlong.org/wezterm/index.html) as a terminal emulator and [Neovim](https://neovim.io/) as a text editor.
My dotfiles live in a bare git repository with `$HOME` as the worktree. It's inspired by [this blog article](https://www.atlassian.com/git/tutorials/dotfiles).

## Install instructions

1. Install wezterm

```shell-session
yay -S wezterm
```

2. ZSH

Install ZSH
```shell-session
yay -S zsh
```
Set zsh as the default-shell for the current user
```shell-session
chsh -s /bin/zsh
```
3. Install OhmyZSH

Use the [official installation guide](https://ohmyz.sh/#install)

4. Install neovim

```shell-session
yay -S neovim
```

5. Ignore .cfg in .gitignore

```shell-session
touch ~/.gitignore
echo ".cfg" >> ~/.gitignore
```

6. Clone repo
After setting up SSH for github, clone the repo as `--bare`:

```shell-session
git clone --bare git@github.com:kongreif/.cfg.git $HOME/.cfg
```

Then set alias for current shell scope.

```shell-session
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Checkout the actual content from the bare repository to your $HOME:

```shell-session
config checkout
```
If above fails, move / delete .zshrc and run again.


7. Set showUntrackedFiles to no
Set the flag showUntrackedFiles to no on this specific (local) repository:
```shell-session
config config --local status.showUntrackedFiles no
```

Now you can run git commands for the config like:
```shell-session
config status
config add .filename
config commit -m "Add filename"
config push
```

8. Setup neovim
In order for telescope to work, you'll need to install ripgrep

```shell-session
yay -S ripgrep
```

### Rails dev related setup

1. Install ruby
Install ruby-install
```shell-session
yay -S ruby-install
```

Install chruby
```shell-session
yay -S chruby
```

Run ruby-install
```shell-session
ruby-install
```

Then install desired ruby version, e.g.
```shell-session
ruby-install 3.3.3
```

2. Install PostgreSQL
```shell-session
yay -S postgresql
```

Initialize PostgreSQL database cluster:
```shell-session
sudo su - postgres -c "initdb --locale en_US.UTF-8 -D /var/lib/postgres/data"
```

Start the PostgreSQL service and enable it to start on boot:
```shell-session
sudo systemctl start postgresql
sudo systemctl enable postgresql
```
