#!/usr/bin/env bash
# adapted from https://github.com/donnemartin/dev-setup/blob/master/brew.sh

cd $HOME

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install xcode CLI
xcode-select --install

# make GO directories
mkdir $HOME/.go
mkdir $HOME/.go/bin
mkdir $HOME/.go/src
mkdir $HOME/.go/pkg
mkdir -p $HOME/projects/go/bin
mkdir -p $HOME/projects/go/src
mkdir -p $HOME/projects/go/pkg

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# git setup
git config --global user.name "nofun97"
git config --global user.email "novan.allanadi1211@gmail.com"
git config --global color.ui true
git config --global core.editor vim
git config --global credential.helper store

# zsh
brew install zsh zsh-completions
chsh -s /bin/zsh

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
