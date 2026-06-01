#!/usr/bin/env bash

set -eou

mv -f ~/.config/nvim{,.bak}
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/
cp -R nvim ~/.config/nvim

mv -f ~/.tmux.conf{,.bak}
cp .tmux.conf ~/.tmux.conf

mv -f ~/.zshrc{,.bak}
cp .zshrc ~/.zshrc

mkdir -p ~/.local/bin
cp tmux-sessionizer ~/.local/bin

mkdir -p ~/.config/ghostty
mv ~/.config/ghostty/config{,.bak}
cp ghostty.config ~/.config/ghostty/config

source ~/.zshrc
