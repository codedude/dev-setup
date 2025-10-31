#!/bin/bash

# Install deps
apt update
apt install -y git curl wget fzf ripgrep thefuck lsd fd-find nodejs npm tmux tldr luarocks

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/
rm -f lazygit lazygit.tar.gz
npm install -g tree-sitter-cli

# Bash config
touch ~/.bashrc
echo -e "alias bashconfig=\"nvim ~/.bashrc\"\nalias bashreload=\"source ~/.bashrc\"" >> ~/.bashrc
echo 'eval $(thefuck --alias)' >> ~/.bashrc

# tmux conf
touch ~/.tmux.conf
#cp ~/.tmux.conf ~/.tmux.conf.OLD
#cp .tmux.conf ~/.tmux.conf

# nvim conf
apt-get install ninja-build gettext cmake build-essential
git clone https://github.com/neovim/neovim.git && cd neovim
make CMAKE_BUILD_TYPE=Release
make install
ln -sf /usr/local/bin/nvim /usr/bin/nvim
cd ../ && rm -rf neovim

echo -e "alias vi=nvim\nalias vim=nvim\nEDITOR=nvim" >> ~/.bashrc
mv -f ~/.config/nvim{,.bak}
mv -f ~/.local/share/nvim{,.bak}
mv -f ~/.local/state/nvim{,.bak}
mv -f ~/.cache/nvim{,.bak}
cp -r nvim ~/.config/nvim

source ~/.bashrc

echo "To finish installation, run nvim, then lazyhealth"
