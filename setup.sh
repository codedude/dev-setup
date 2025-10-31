#!/bin/bash

# Install deps
apt update
apt install -y neovim git curl wget fzf ripgrep thefuck lsd fd-find nodejs npm tmux tldr luarocks

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/

npm install -g tree-sitter-cli

# Bash config
touch ~/.bashrc
echo -e "alias bashconfig=\"nvim ~/.bashrc\"\nalias bashreload=\"source ~/.bashrc\"" >> ~/.bashrc
echo 'eval $(thefuck --alias)' >> ~/.bashrc

# tmux conf
touch ~/.tmux.conf
cp ~/.tmux.conf ~/.tmux.conf.OLD
cp .tmux.conf ~/.tmux.conf

# nvim conf
echo -e "alias vi=nvim\nalias vim=nvim\nEDITOR=nvim" >> ~/.bashrc
cp -r nvim ~/.config/nvim
cd ~/.config/nvim

source ~/.bashrc

echo "To finish installation, run nvim, then lazyhealth"
