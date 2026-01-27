#!/usr/bin/env bash

set -euo pipefail

echo "=== Starting setup script ==="

# Paths
DOTFILES_DIR=~/dotfiles
TMUX_CONF=~/.config/tmux
TMUX_SESSIONIZER=~/.local/scripts/tmux-sessionizer.sh
POMODORO_TIMER=~/.local/scripts/pomodoro-status.sh
NEOVIM_CONF=~/.config/nvim

# Function to check command existence
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo
echo "=== Checking for Homebrew ==="
if ! command_exists brew; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

echo
echo "=== Installing tmux ==="
if ! command_exists tmux; then
    echo "tmux not found. Installing via brew..."
    brew install tmux
else
    echo "tmux is already installed."
fi

echo
echo "=== Installing Neovim ==="
if ! command_exists nvim; then
    echo "Neovim not found. Installing via brew..."
    brew install neovim
else
    echo "Neovim is already installed."
fi

echo
echo "=== Setting up tmux ==="

# Backup existing tmux config
if [ -d "$TMUX_CONF" ]; then
    echo "Backing up existing tmux config to ${TMUX_CONF}.bak"
    mv "$TMUX_CONF" "${TMUX_CONF}.bak"
fi

# Copy new tmux config
mkdir "$TMUX_CONF"
echo "Copying new Tmux config from $DOTFILES_DIR/tmux..."
cp "$DOTFILES_DIR/tmux/tmux.conf" "$TMUX_CONF"
cp "$DOTFILES_DIR/tmux/tmux.reset.conf" "$TMUX_CONF"

# Ensure tmux plugins folder exists
mkdir -p "$TMUX_CONF/plugins"

# Clone TPM if not already present
if [ ! -d "$TMUX_CONF/plugins/tpm" ]; then
    echo "Cloning TPM into $TMUX_CONF/plugins/tpm..."
    git clone https://github.com/tmux-plugins/tpm "$TMUX_CONF/plugins/tpm"
else
    echo "TPM already installed."
fi

# Reminder about tmux.conf plugin lines
echo
echo "Please make sure the plugins in tmux.conf are uncommented if needed."
echo "After starting tmux, press Ctrl-a + I to install plugins."

# Copy tmux-sessionizer.sh
mkdir -p "$(dirname "$TMUX_SESSIONIZER")"
echo
echo "Copying tmux-sessionizer.sh to $TMUX_SESSIONIZER..."
cp "$DOTFILES_DIR/tmux/tmux-sessionizer.sh" "$TMUX_SESSIONIZER"
chmod +x "$TMUX_SESSIONIZER"
echo "Done."

# Copy pomodoro-timer.sh
mkdir -p "$(dirname "$POMODORO_TIMER")"
echo
echo "Copying pomodoro-status.sh to $POMODORO_TIMER..."
cp "$DOTFILES_DIR/tmux/pomodoro-status.sh" "$POMODORO_TIMER"
chmod +x "$POMODORO_TIMER"
echo "Done."

# Build and add my own session picker
echo
echo "Cloning My Session Picker to ~/projects/..."
git clone https://github.com/WWiet/tmux-session-picker.git ~/projects/
echo "Building Session Picker (Golang must be installed)..."
cd ~/projects/tmux-session-picker/
go build -o ~/.local/bin/session-picker .
echo "Done."


echo
echo "=== Setting up Neovim ==="

# Backup existing nvim config
if [ -d "$NEOVIM_CONF" ]; then
    echo "Backing up existing nvim config to ${NEOVIM_CONF}.bak"
    mv "$NEOVIM_CONF" "${NEOVIM_CONF}.bak"
fi

# Copy new nvim config
echo "Copying new Neovim config from $DOTFILES_DIR/nvim..."
cp -r "$DOTFILES_DIR/nvim" "$NEOVIM_CONF"

echo
echo "=== Setup Complete ==="
echo "Remember to open tmux and press Ctrl-a + I to install plugins."
echo "Your tmux-sessionizer script is installed at $TMUX_SESSIONIZER."
echo "Your Neovim config is ready."

