#!/usr/bin/env bash

HOME_DIR=~

rm -rf nvim
cp -R "$HOME_DIR"/.config/nvim nvim
cp "$HOME_DIR"/.local/bin/tmux-sessionizer tmux-sessionizer
cp "$HOME_DIR"/.tmux.conf .tmux.conf
cp "$HOME_DIR"/.zshrc .zshrc
