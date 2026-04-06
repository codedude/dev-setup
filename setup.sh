#!/bin/bash

HOME_DIR=~
ZSHRC="$HOME_DIR"/.zshrc
GO_VERSION=1.32.32

# Install deps
apt update
apt install -y git curl zsh wget fzf ripgrep thefuck lsd fd-find nodejs npm tmux tldr luarocks ninja-build gettext cmake build-essential

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s "$(which zsh)"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM"/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/you-should-use
sed -i 's/plugins=(git)/plugins=(\ngit\nyou-should-use\nzsh-autosuggestions\n)/' "$ZSHRC"

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x97_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/
rm -f lazygit lazygit.tar.gz

# Bash config
touch "$ZSHRC"
echo -e "alias zshconfig=\"nvim $ZSHRC\"\nalias zshreload=\"source $ZSHRC\"" >>"$ZSHRC"
echo -e "eval $(thefuck --alias)" >>"$ZSHRC"
echo -e "eval $(ssh-agent -s)" >>"$ZSHRC"

# tmux conf
touch "$HOME_DIR"/.tmux.conf
cp "$HOME_DIR"/.tmux.conf "$HOME_DIR"/.tmux.conf.OLD
cp .tmux.conf "$HOME_DIR"/.tmux.conf
echo -e "alias tmuxs=\"tmux attach-session -t dev || tmux new-session -s dev\"" >>"$ZSHRC"

# go conf
curl -fsSL -o go.tar.gz https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz
ln -sf /usr/local/go/bin/go /usr/bin/go
ln -sf /usr/local/go/bin/gofmt /usr/bin/gofmt
mkdir -p "$HOME_DIR"/go
echo -e "export GOPATH=\"$HOME_DIR/go\"" >>"$ZSHRC"
echo -e "export GOROOT=\"/usr/local/go\"" >>"$ZSHRC"
echo -e "export PATH=\"\$PATH:\$GOROOT/bin\"" >>"$ZSHRC"
/usr/local/go/bin/go install golang.org/x/tools/cmd/goimports@latest

# nvim conf
# apt-get install -y ninja-build gettext cmake build-essential
git clone https://github.com/neovim/neovim.git && cd neovim || exit
make CMAKE_BUILD_TYPE=Release
make install
ln -sf /usr/local/bin/nvim /usr/bin/nvim
cd ../ && rm -rf neovim
npm install -g tree-sitter-cli tree-sitter-regex tree-sitter-bash tree-sitter-go tree-sitter-perl tree-sitter-json tree-sitter-markdown tree-sitter-python @tree-sitter-grammars/tree-sitter-yaml tree-sitter-make
echo -e "alias vi=nvim\nalias vim=nvim\nEDITOR=nvim" >>"$ZSHRC"
mv -f "$HOME_DIR"/.config/nvim{,.bak}
mv -f "$HOME_DIR"/.local/share/nvim{,.bak}
mv -f "$HOME_DIR"/.local/state/nvim{,.bak}
mv -f "$HOME_DIR"/.cache/nvim{,.bak}
mkdir -p "$HOME_DIR"/.config
cp -r ./nvim "$HOME_DIR"/.config/nvim

echo "To finish installation, run nvim > :lazyhealth."
