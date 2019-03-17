# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.bin:/usr/local/bin:/Library/TeX/texbin:$PATH

export TERM="xterm-256color"

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Make a directory and change into it
# function mkcd() { mkdir -p "$@" && cd "$_"; }

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  git-extras
  colored-man
  colorize
  pip
  python
  node
  npm
  brew
  osx
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR=vim
alias sqlite="sqlite3"
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias ltx_d="latexdockerdaemon"
alias ltx="latexdockerdaemoncmd"

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
