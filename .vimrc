set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-classpath'
"Plugin 'guns/vim-clojure-static'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rodjek/vim-puppet'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-expand-region'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'

"Built-in plugin to enable % to match delimiters
runtime macros/matchit.vim

call vundle#end()
filetype plugin indent on

"Only apply the following settings if soloarized theme is present
if isdirectory($HOME."/.vim/bundle/vim-colors-solarized")
  let g:solarized_termtrans = 1

  syntax enable
  colorscheme solarized
  set background=dark
endif

"Personal config
set hlsearch
set incsearch
set relativenumber
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
set spell
set timeoutlen=1000 ttimeoutlen=0

"Personal Mapping
nmap <Left> :bprevious<CR>
nmap <Right> :bnext<CR>
nmap <Up> :bfirst<CR>
nmap <Down> :blast<CR>

"NERDTree config
map <f9> :NERDTreeToggle<CR>

"GUndo.vim config
nnoremap <F4> :GundoToggle<CR>

"Vim expand region remapping
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"Map fugitive command
cmap git Git

"Visual star search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"Vim Airline config
set laststatus=2

"Vim Bufferline confi
let g:bufferline_echo=0
