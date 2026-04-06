#!/usr/bin/env bash

set -eou

brew install neovim \
  ripgrep \
  fd \
  lazygit \
  fzf \
  stylua \
  shfmt \
  clang-format \
  dockerfmt \
  lua-language-server \
  llvm \
  golangci-lint \
  shellcheck

npm install -g \
  tree-sitter-cli \
  bash-language-server \
  yaml-language-server

go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install github.com/google/yamlfmt/cmd/yamlfmt@latest

mv ~/.config/nvim ~/.config/nvim-bak &>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim-bak &>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim-bak &>/dev/null
rm -rf ~/.cache/nvim-bak &>/dev/null
