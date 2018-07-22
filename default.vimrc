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


call plug#end()

" Define maps for your plugins
nnoremap <Leader>o :CtrlP<CR>

" colorscheme alduin
" colorscheme Apprentice
" colorscheme deus
" colorscheme sierra
" colorscheme jellybeans
" colorscheme gotham
colorscheme tender

map <C-n> :NERDTreeToggle<CR>
