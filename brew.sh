#!/bin/bash 

xcode-select --install

#Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup being able to use a Brewfile
brew tap Homebrew/bundle

# Install all of the things
brew bundle

