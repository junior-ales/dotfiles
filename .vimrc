set nocompatible 
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/ctrlp.vim'

runtime macros/matchit.vim

filetype plugin indent on 

syntax enable
set background=dark
colorscheme solarized

"Personal config
set hlsearch
set incsearch
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set wildmenu
set wildmode=full
set history=200
set hidden
set pastetoggle=<f5>
set smartcase
set spell

"Visual star search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"CtrlP custom search for git projects
"TODO check if it's a git project before setting g:ctrlp_user_command
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
