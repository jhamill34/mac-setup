#!/bin/bash 

xcode-select --install

#Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup being able to use a Brewfile
brew tap Homebrew/bundle

# Install all of the things
brew bundle

# Install Plug (VIM)
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Power Level 9000
git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k

# Install TMUX Package Manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Move the initialization files to their proper locations
cp vimrc $HOME/.vimrc 
cp zshrc $HOME/.zshrc
cp gitignore $HOME/.gitignore_global 
cp tmux.conf $HOME/.tmux.conf 

# Install yeoman and tsserver for generators and ts completer
npm install -g yo
npm install -g tsserver

# Scripts used in the tmux config file
mkdir $HOME/.bin
cp bin/* $HOME/bin

# Install Vim Plugins
vim +'PlugInstall --sync' +qa

# Get YCM configured
cd $HOME/.vim/plugged/YouCompleteMe 
rm -rf $HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/tern_runtime/node_modules
./install.py --java-completer --clang-completer --js-completer


