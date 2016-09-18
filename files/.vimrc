set nocompatible		" required
filetype off			" required

set encoding=utf-8
set laststatus=2
set scrolloff=3
set autoindent
set showmode
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set relativenumber
set undofile
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=79

let mapleader=" "


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
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'rdnetto/YCM-Generator'		" Compile flags generator

" /\ All Plugins have to be added above /\
call vundle#end()		" required
filetype plugin indent on	" required

" Mark extra whitespaces in Python and C/C++
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp nested match BadWhitespace /\s\+$/

" Python PEP8 indentations
au BufNewFile,BufRead *.py nested
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set fileformat=unix |

" Close autocomplete window when finished
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_python_interpreter='/usr/bin/python3.5'

" Map key(s) to goto definition/declaration
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python highlighting
let python_highlight_all=1
syntax on

" Python virtual environment support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" Line numbering
set nu
