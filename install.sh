#!/usr/bin/env bash

cd $HOME

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install xcode CLI
xcode-select --install

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# zsh
brew install zsh zsh-completions
chsh -s /bin/zsh

# install java 8
brew tap homebrew/cask-versions
brew cask install java8

# install fura code nerd font
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font

# install vscodium
brew cask install vscodium

# install python 3
brew install python3
pip3 install --user virtualenv

# golang
brew install go
