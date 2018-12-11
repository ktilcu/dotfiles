#!/usr/bin/env bash
#
# Install local bundles
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c "PlugInstall" -c "q" -c "q"
