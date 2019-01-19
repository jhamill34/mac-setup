# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.bin:/usr/local/bin:$PATH

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Make a directory and change into it
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

# zsh tmux settings
ZSH_TMUX_AUTOSTART='true'

# POWERLEVEL 9K CONFIG
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="trunkate_left"

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
  tmux
  tmuxinator
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR=vim
alias sqlite="sqlite3"
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

