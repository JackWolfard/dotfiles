call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
call plug#end()

syntax enable
syntax on
colorscheme onedark

" spacing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" ui
set number
set showcmd
"set cursorline
set wildmenu
set lazyredraw
set showmatch
set colorcolumn=80

" searching
set incsearch
set hlsearch

" mouse
set mouse=a

