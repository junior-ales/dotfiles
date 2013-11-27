set nocompatible 
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bronson/vim-visual-star-search'

runtime macros/matchit.vim

filetype plugin indent on 

syntax enable
set background=dark
colorscheme solarized

"Personal config
set hlsearch
set incsearch
set number
set tabstop=2
set shiftwidth=2
set expandtab
set wildmenu
set wildmode=full
set history=200
set hidden
set pastetoggle=<f5>
set smartcase
