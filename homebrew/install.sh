#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  x You should probably install Homebrew first:"
  echo "    https://github.com/mxcl/homebrew/wiki/installation"
  # install brew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# install cask
brew install caskroom/cask/brew-cask

# Install homebrew packages
brew install \
  arp-scan \
  coreutils \
  git \
  go \
  grc \
  hub \
  macvim \
  mtr \
  node \
  python \
  rename \
  spark \
  the_silver_searcher \
  tig \
  tlassemble \
  tmux \
  tree \
  vim \
  watch \
  wget \
  zsh

brew cask install \
  iterm2 \
  virtualbox

exit 0
