# 1. Install wezterm
E.g.
```
yay wezterm
```
# 2. Install nvim
E.g.
```
yay neovim
```
# 3. Set default shell to ZSH
## 3.1 Install ZSH
```
yay zsh
```
## 3.2 Set default shell for your user
```
chsh -s /bin/zsh
```
# 4. Ignore .cfg in .gitignore
```
touch ~/.gitignore
echo ".cfg" >> ~/.gitignore
```
# 5. Clone repo
After setting up SSH for github, clone the repo:
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
# 6. Set showUntrackedFiles to no
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
# 7. Setup nvim
```
nvim test
```
# 7.1 Setup copilot
Copilot installation will fail at first.
Install NodeJS
```
yay nodejs
```
Start Neovim and invoke `:Copilot setup` and then `:Copilot auth`
# 7.2 Setup telescope
Install ripgrep
```
yay ripgrep
```
# 8. Rails dev related setup
## 8.1 Install ruby
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
## 8.2 Install PostgreSQL
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
