set nocompatible		" required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'		" Vundle plugin manager

Plugin 'tmhedberg/SimpylFold'		" Folding
Plugin 'vim-scripts/indentpython.vim'	" Python autoindent
Plugin 'Valloric/YouCompleteMe'		" Autocompletion
Plugin 'scrooloose/nerdtree'		" File tree
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" /\ All Plugins have to be added above /\
call vundle#end()		" required
filetype plugin indent on	" required

" Enable UTF-8 encoding
set encoding=utf-8

" Show powerline statusbar
set laststatus=2

" Mark extra whitespaces in Python and C/C++
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp nested match BadWhitespace /\s\+$/

" Python PEP8 indentations
au BufNewFile,BufRead *.py nested
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
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
