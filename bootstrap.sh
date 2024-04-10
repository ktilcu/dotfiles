#!/usr/bin/env bash

# ./.macos
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle
nvm install stable && nvm use stable
npm i -g "$(cat global_npm)"
pip3 install -r global_pip
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".macos" \
	--exclude "bootstrap.sh" \
	--exclude "README.md" \
	--exclude "LICENSE-MIT.txt" \
	--exclude "Brewfile" \
	-avh --no-perms . ~;

nvim --headless +PlugInstall +qall
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
