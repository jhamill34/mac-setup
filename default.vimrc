" Powerline

" Select your Leader key
let mapleader = "\<Space>"

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/LanguageTool'

call plug#end()

" Define maps for your plugins
nnoremap <Leader>o :CtrlP<CR>

" Set path to language checker
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.2/libexec/languagetool-commandline.jar'

" colorscheme alduin
" colorscheme Apprentice
" colorscheme deus
" colorscheme sierra
" colorscheme jellybeans
" colorscheme gotham
colorscheme tender

map <C-n> :NERDTreeToggle<CR>
