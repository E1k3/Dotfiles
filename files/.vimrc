set nocompatible		" required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'			" Vundle plugin manager

Plugin 'tmhedberg/SimpylFold'			" Folding
Plugin 'vim-scripts/indentpython.vim'	" Python autoindent
Plugin 'Valloric/YouCompleteMe'			" Autocompletion
Plugin 'scrooloose/nerdtree'			" File tree
Plugin 'kien/ctrlp.vim'					" Fuzzy Search
Plugin 'rdnetto/YCM-Generator'			" Compile flags generator
Plugin 'chrisbra/SudoEdit.vim'			" Read&Write files with root privileges
Plugin 'itchyny/lightline.vim'			" Light status line plugin
Plugin 'tpope/vim-fugitive'				" Git status
Plugin 'tpope/vim-surround'				" Surround text with tags&braces
Plugin 'tpope/vim-repeat'				" Repeat support for plugin commands
Plugin 'vimwiki/vimwiki'				" Wiki

" /\ All Plugins have to be added above /\
call vundle#end()		" required

filetype plugin indent on
syntax on

set encoding=utf-8
set ttyfast
set lazyredraw

set nu
set cursorline
set ruler
set relativenumber
set laststatus=2
set scrolloff=3
set showmode
set hidden

set visualbell
set backspace=indent,eol,start
set undofile
set nolist

set smartcase
set incsearch
set showmatch
set hlsearch

set textwidth=0
set wrapmargin=0
set wrap
set linebreak

set autoindent
set tabstop=4
set shiftwidth=4
set showcmd

let mapleader="\\"


" <Space> Leader binding
map <Space> <Leader>

" Brace closing mappings
inoremap ( ()<Left>
inoremap < <><Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

inoremap () ()
inoremap <> <>
inoremap {} {}
inoremap [] []
inoremap "" ""
inoremap '' ''

inoremap (<BS> <Nop>
inoremap <<BS> <Nop>
inoremap {<BS> <Nop>
inoremap [<BS> <Nop>
inoremap "<BS> <Nop>
inoremap '<BS> <Nop>

" Mark extra whitespaces in Python and C/C++
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.java,*.py,*.pyw,*.c,*.h,*.cpp,*.hpp nested match BadWhitespace /\s\+$/

" Python PEP8 indentations
au BufNewFile,BufRead *.py nested
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set fileformat=unix |

" Lightline settings
let g:lightline = {
	\ 'colorscheme' : 'wombat',
	\ }

" Close autocomplete window when finished
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_python_interpreter='/usr/bin/python3.5'
let g:ycm_python_binary_path='/usr/bin/python3.5'

" Map key(s) to goto definition/declaration
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python highlighting
let python_highlight_all=1

