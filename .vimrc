set nocompatible               " be iMproved
filetype off                   " required!

" Bootstrap Vundle
let vundle_ready = 1
if !filereadable(expand('~/.vim/bundle/vundle/README.md'))
    let vundle_ready = 0
    echo 'Found that Vundle is not installed. Installing...'
    echo
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'fatih/vim-go'
Bundle 'flazz/vim-colorschemes'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'jnurmine/Zenburn'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'mbbill/undotree'
Bundle 'mileszs/ack.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'Pychimp/vim-sol'
Bundle 'rdolgushin/groovy.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'Yggdroot/indentLine'
Bundle 'NLKNguyen/papercolor-theme'
Bundle 'jiangmiao/auto-pairs'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'dracula/vim'
Bundle 'lilydjwg/colorizer'
Bundle 'leafgarland/typescript-vim'

if vundle_ready == 0
    echo 'Installing bundles...'
    echo
    :BundleInstall
endif

filetype plugin indent on     " required!

" force correct backspace behavior
set backspace=indent,eol,start

" nerdtree
map <leader>n :NERDTreeToggle<CR>
map <leader><leader>n :NERDTreeFocus<CR>
autocmd vimenter * if !argc() | NERDTree | endif

"syn on
set t_Co=256   " This is may or may not needed.
colorscheme monokai-chris 

" folding
autocmd FileType mkd normal zR

" tagbar
map <leader>t :TagbarOpenAutoClose<CR>
map <leader>tt :TagbarToggle<CR>

" line numbering
set number
set relativenumber
autocmd BufEnter * set relativenumber

" Map the arrow keys to be based on display lines, not physical lines
nnoremap <silent> j :<C-U>call Down(v:count)<CR>
vnoremap <silent> j gj

nnoremap <silent> k :<C-U>call Up(v:count)<CR>
vnoremap <silent> k gk

" include this function from http://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
" to make 10k work correctly in relativenumber
function! Down(vcount)
    if a:vcount == 0
        exe "normal! gj"
    else
        exe "normal! ". a:vcount ."j"
    endif
endfunction

function! Up(vcount)
    if a:vcount == 0
        exe "normal! gk"
    else
        exe "normal! ". a:vcount ."k"
    endif
endfunction

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" tab, linebreak & wrap settings
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set wrap

" airline settings
let g:airline#extensions#tabline#enabled = 1

" buffer navigation
map <Leader>] :bn<CR>
map <Leader>[ :bp<CR>
" tab navigation
map <Leader>tn :tabnew<CR>
map <Leader><Leader>] :tabn<CR>
map <Leader><Leader>[ :tabp<CR>
map <Leader>w :bd<CR> :NERDTreeFocus<CR>

noremap <Leader>= :Tab /=<CR>
noremap <Leader><Leader>= :Tab /=><CR>

" overtone REPL shortcuts
map <Leader>e {V}:Eval<CR>

" ack settings
let g:ack_default_options = " -s -H --nocolor --nogroup --column --ignore-dir=.pe_build --ignore-dir=.vagrant --ignore-dir=coverage"

set modeline
set modelines=5

" permanent undo
if has("persistent_undo")
    set undodir=expand('~/.vim/undodir/')
    set undofile
endif

" options i stole from /etc/vim/vimrc
set showcmd    " Show (partial) command in status line.
set showmatch  " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search

" indentLine
let g:indentLine_color_term = 241

" force airline to show up
set laststatus=2

" set line number to match dracula theme
autocmd BufEnter * hi CursorLineNr ctermfg=175
