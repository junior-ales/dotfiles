set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rodjek/vim-puppet'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-expand-region'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'

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
set list
set listchars=trail:·
set cursorline
set hlsearch
set incsearch
set relativenumber
set number
set tabstop=2
set shiftwidth=2
set expandtab
set wildmenu
set wildmode=full
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set history=200
set pastetoggle=<f5>
set hidden
set smartcase
set spell
set timeoutlen=1000 ttimeoutlen=0
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " use bar for cursor in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" "

"Personal Mapping
nmap <Left> :bprevious<CR>
nmap <Right> :bnext<CR>
nmap <Up> :bfirst<CR>
nmap <Down> :blast<CR>

" Moves selected lines up and down with <c-{j,k}>
" '> is the last line of the visual selection
vnoremap <C-j> :m'>+1<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

"NERDTree config
map <F9> :NERDTreeToggle<CR>

"GUndo.vim config
nnoremap <F4> :GundoToggle<CR>

"Vim expand region remapping
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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

"Vim Bufferline config
let g:bufferline_echo=0
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = -1 "always last

"Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
