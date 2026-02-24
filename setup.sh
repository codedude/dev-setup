#!/bin/bash

# Install deps
apt update
apt install -y git curl zsh wget fzf ripgrep thefuck lsd fd-find nodejs npm tmux tldr luarocks ninja-build gettext cmake build-essential

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
sed -i 's/plugins=(git)/plugins=(\ngit\nyou-should-use\nzsh-autosuggestions\nzsh-syntax-highlighting\n)/' ~/.zshrc

# lazygit
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

# go conf
curl -fsSL -o go.tar.gz https://go.dev/dl/go1.25.7.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz
ln -sf /usr/local/go/bin/go /usr/bin/go
ln -sf /usr/local/go/bin/gofmt /usr/bin/gofmt
mkdir -p /root/go
echo -e "export GOPATH=\"/root/go\"" >>~/.zshrc
echo -e "export GOROOT=\"/usr/local/go\"" >>~/.zshrc
echo -e "export PATH=\"\$PATH:\$GOROOT/bin\"" >>~/.zshrc
/usr/local/go/bin/go install golang.org/x/tools/cmd/goimports@latest

# nvim conf
# apt-get install -y ninja-build gettext cmake build-essential
git clone https://github.com/neovim/neovim.git && cd neovim
make CMAKE_BUILD_TYPE=Release
make install
ln -sf /usr/local/bin/nvim /usr/bin/nvim
cd ../ && rm -rf neovim
npm install -g tree-sitter-cli tree-sitter-regex tree-sitter-bash tree-sitter-go tree-sitter-perl tree-sitter-json tree-sitter-markdown tree-sitter-python @tree-sitter-grammars/tree-sitter-yaml tree-sitter-make
echo -e "alias vi=nvim\nalias vim=nvim\nEDITOR=nvim" >>~/.zshrc
mv -f ~/.config/nvim{,.bak}
mv -f ~/.local/share/nvim{,.bak}
mv -f ~/.local/state/nvim{,.bak}
mv -f ~/.cache/nvim{,.bak}
mkdir -p ~/.config
cp -r ./nvim ~/.config/nvim

echo "To finish installation, reboot then run nvim > :lazyhealth."
