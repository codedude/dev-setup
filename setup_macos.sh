#!/usr/bin/env bash

set -eou

brew install nvim ripgrep fd lazygit fzf

mv ~/.config/nvim ~/.config/nvim-bak &>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim-bak &>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim-bak &>/dev/null
rm -rf ~/.cache/nvim-bak &>/dev/null

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
