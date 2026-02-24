#!/bin/bash

# Install deps
apt update
apt install -y git curl zsh wget fzf ripgrep thefuck lsd fd-find nodejs npm tmux tldr luarocks

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
/bin/zsh

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/
rm -f lazygit lazygit.tar.gz

# Bash config
touch ~/.zshrc
echo -e "alias zshconfig=\"nvim ~/.zshrc\"\nalias zshreload=\"source ~/.zshrc\"" >>~/.zshrc
echo 'eval $(thefuck --alias)' >>~/.zshrc
echo 'eval $(ssh-agent -s)' >>~/.zshrc

# tmux conf
touch ~/.tmux.conf
cp ~/.tmux.conf ~/.tmux.conf.OLD
cp .tmux.conf ~/.tmux.conf
echo -e "alias tmuxs=\"tmux attach-session -t dev || tmux new-session -s dev\"" >>~/.zshrc

# nvim conf
apt-get install -y ninja-build gettext cmake build-essential
git clone https://github.com/neovim/neovim.git && cd neovim
make CMAKE_BUILD_TYPE=Release
make install
ln -sf /usr/local/bin/nvim /usr/bin/nvim
cd ../ && rm -rf neovim
npm install -g tree-sitter-cli tree-sitter-regex tree-sitter-bash tree-sitter-go tree-sitter-perl tree-sitter-json tree-sitter-markdown tree-sitter-python @tree-sitter-grammars/tree-sitter-yaml tree-sitter-makefile

# go conf
apt install -y golang-go
echo -e "export GOPATH=$HOME/go" >>~/.zshrc
echo -e "export PATH=$PATH:$GOPATH/bin" >>~/.zshrc
go install golang.org/x/tools/cmd/goimports@latest

echo -e "alias vi=nvim\nalias vim=nvim\nEDITOR=nvim" >>~/.zshrc
mv -f ~/.config/nvim{,.bak}
mv -f ~/.local/share/nvim{,.bak}
mv -f ~/.local/state/nvim{,.bak}
mv -f ~/.cache/nvim{,.bak}
cp -r nvim ~/.config/nvim

source ~/.zshrc

echo "To finish installation, run nvim, then :lazyhealth. Then reboot."
