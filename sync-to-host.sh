#!/usr/bin/env bash

set -eou

mv -f ~/.config/nvim{,.bak}
mv -f ~/.local/share/nvim{,.bak}
mv -f ~/.local/state/nvim{,.bak}
rm -rf ~/.cache/nvim
cp -R nvim ~/.config/nvim

mv -f ~/.tmux.conf{,.bak}
cp .tmux.conf ~/.tmux.conf

mv -f ~/.zshrc{,.bak}
cp .zshrc ~/.zshrc

mkdir -p ~/.local/bin
cp tmux-sessionizer ~/.local/bin

source ~/.zshrc
