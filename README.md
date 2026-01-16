# README

## Just install it for me commands
```bash
chmod +x install.sh
./install.sh
```

## Tmux
Installing tmux is probably the most difficult. Here are the steps.
1. Make sure to copy the TPM (tmux package manager) from the repo into the tmux folder here ~/.config/tmux/plugins
```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```
2. Then uncomment the plugins in the tmux.conf file
3. Then refresh tmux and then hit ctrl-a+I to install all the plugins
```keypress
ctrl-a + I
```
4. After this you will want to copy the tmux-sessionizer into ~/.local/scripts/ folder
```bash
mv ~/dotfiles/tmux/tmux-sessionizer.sh ~/.local/scripts/
```

## Neovim
Neovim is easy. Just replace the current nvim folder with the one from here to ~/.config/nvim
```bash
mv ~/.config/nvim ~/.config/nvim.bak
cp ~/dotfiles/nvim ~/.config/
```
