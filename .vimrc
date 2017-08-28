set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-expand-region'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-startify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/AutoClose'

"JavaScript
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'vim-syntastic/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'mxw/vim-jsx'

"Built-in plugin to enable % to match delimiters
runtime macros/matchit.vim

call vundle#end()
filetype plugin indent on

"Personal config

"Only apply the following settings if using SOLARIZED theme
if isdirectory($HOME."/.vim/bundle/vim-colors-solarized")
  syntax on
  set t_Co=16

  colorscheme solarized
  set background=dark
endif

" Only apply the following settings if using DISTINGUISHED theme
" colorscheme distinguished

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
set wildignore+=*/tmp/*,*/node_modules/*,*/target/*,*/out/*,*.so,*.swp,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.zip,*.gz,*.bz,*.tar
set history=200
set pastetoggle=<f5>
set hidden
set smartcase
"set spell
set timeoutlen=1000 ttimeoutlen=0
set nowrap

" changes the cursor in insert mode | mac only
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" changes the cursor in insert mode | ubuntu
" if has("autocmd")
"   au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
"   au InsertEnter,InsertChange *
"         \ if v:insertmode == 'i' |
"         \   silent execute '!echo -ne "\e[6 q"' | redraw! |
"         \ elseif v:insertmode == 'r' |
"         \   silent execute '!echo -ne "\e[4 q"' | redraw! |
"         \ endif
"   au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
" endif

"Personal Mapping
nmap <Left> :bprevious<CR>
nmap <Right> :bnext<CR>
nmap <Up> :bfirst<CR>
nmap <Down> :blast<CR>
nnoremap <Space><Tab> <C-^>

" Moves selected lines up and down with <c-{j,k}>
" '> is the last line of the visual selection
vnoremap <C-j> :m'>+1<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

"NERDTree config
map <F9> :NERDTreeToggle<CR>
map <F8> :NERDTreeFind<CR>

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

"Ctrl-P config
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"Boot config
au BufRead,BufNewFile *.boot set filetype=clojure

" Moving temp files away (NOTE: the dir '.vim-tmp' needs to be created)
" set backup
" set swapfile
" set backupdir=~/.vim-tmp
" set directory=~/.vim-tmp

" JS Libs
let g:used_javascript_libs = 'react,jasmine,chai,ramda,jest'

" Prettier config
autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote\ --print-width\ 100

" Startify config
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
      \ '~/Projects/dotfiles/.vimrc',
      \ '~/Projects/exercism/ecmascript/.eslintrc',
      \ '~/Projects/junior-ales.github.io/cover-page/build.boot',
      \ ]

" JS related files
au BufRead,BufNewFile .eslintrc set filetype=json
au BufRead,BufNewFile .babelrc set filetype=json
au BufRead,BufNewFile *.marko set filetype=javascript

" Jenkins file
au BufRead,BufNewFile Jenkinsfile* set filetype=groovy

" Supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
