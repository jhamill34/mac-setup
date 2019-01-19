" Powerline

" Select your Leader key
let mapleader = "\<Space>"

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/LanguageTool'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'

call plug#end()

" Define maps for your plugins
nmap <F8> :TagbarToggle<CR>

" Set path to language checker
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.2/libexec/languagetool-commandline.jar'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

colorscheme tender

inoremap <C-c> <Esc>

map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

set backupcopy=yes
set exrc
