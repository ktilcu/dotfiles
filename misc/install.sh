#!/usr/bin/env bash
#
# Installer for misc things
DEV_DIR="$HOME/development"
if [ ! -d "$DEV_DIR" ]; then
    mkdir "$DEV_DIR"
fi

install_vim_stuff () {
    git clone https://github.com/square/maximum-awesome.git "$DEV_DIR/maximum-awesome"
    cd !$
    rake
}

install_vim_stuff
