#!/usr/bin/env bash

cd $HOME

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# wget
brew install wget

# install java 8
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8

# install fura code nerd font
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font

# install vscodium
brew cask install vscodium

# install python 3
brew install python3
pip3 install --user virtualenv

# golang and golang lint
brew install go
brew install golangci/tap/golangci-lint
brew upgrade golangci/tap/golangci-lint

# zsh plugins and theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# vim
brew install vim --with-override-system-vi

# install node and stuff
brew install nvm
source $(brew --prefix nvm)/nvm.sh
exec -l $SHELL
NVM_DIR=$HOME/.nvm
nvm install node
brew install yarn

# get .zshrc
wget https://raw.githubusercontent.com/nofun97/my-laptop-setup/master/.zshrc
