set nocompatible		" required
filetype off			" required

set nu
set encoding=utf-8
set laststatus=2
set scrolloff=3
set autoindent
set showmode
set hidden
set visualbell
set cursorline
set ttyfast
set lazyredraw
set ruler
set backspace=indent,eol,start
set relativenumber
set undofile
set smartcase
set incsearch
set showmatch
set hlsearch
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set tabstop=4
set shiftwidth=4
" let mapleader=" "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'		" Vundle plugin manager

Plugin 'tmhedberg/SimpylFold'		" Folding
Plugin 'vim-scripts/indentpython.vim'	" Python autoindent
Plugin 'Valloric/YouCompleteMe'		" Autocompletion
Plugin 'scrooloose/nerdtree'		" File tree
Plugin 'kien/ctrlp.vim'			" Fuzzy Search
Plugin 'rdnetto/YCM-Generator'		" Compile flags generator
Plugin 'chrisbra/SudoEdit.vim'		" Read&Write files with root privileges
Plugin 'itchyny/lightline.vim'		" Light status line plugin
Plugin 'tpope/vim-fugitive'		" Git status

" /\ All Plugins have to be added above /\
call vundle#end()		" required
filetype plugin indent on	" required

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
syntax on

" Python virtual environment support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
" 	project_base_dir = os.environ['VIRTUAL_ENV']
" 	activate_this = os.path.join(project_base_dir, 'bin/activate')
" 	execfile(activate_this, dict(__file__=activate_this))
" EOF

