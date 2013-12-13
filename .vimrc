set nocompatible 
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/vim-auto-save'
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

"Visual star search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
