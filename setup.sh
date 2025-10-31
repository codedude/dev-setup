#!/bin/bash

# Install deps
apt update
apt install -y neovim git curl wget fzf ripgrep thefuck lsd fd-find tree-sitter nodejs tmux lazygit tldr luarocks

# Bash config
touch ~/.bashrc
echo "alias bashconfig=nvim ~/.bashrc\nalias bashreload=source ~/.bashrc" >>~/.bashrc
eval $(thefuck --alias)

# tmux conf
cp ~/.tmux.conf ~/.tmux.conf.OLD
cp .tmux.conf ~/.tmux.conf

# nvim conf
echo "alias vi=nvim\nalias vim=nvim\nEDITOR=nvim" >>~/.bashrc
cp -r nvim ~/.config/nvim
cd ~/.config/nvim

source ~/.bashrc

echo "To finish installation, run nvim, then lazyhealth"
