#!/usr/bin/env bash

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".macos" \
	--exclude "bootstrap.sh" \
	--exclude "README.md" \
	--exclude "LICENSE-MIT.txt" \
	--exclude "Brewfile" \
	-avh --no-perms . ~;

# ./.macos
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew Brewfile
nvm install stable && nvm use stable
npm i -g $(cat global_npm)
pip3 install -r global_pip
nvim --headless +PlugInstall +qall
nvim --headless +CocInstall coc-ultisnips coc-tsserver coc-css coc-json +qall
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
