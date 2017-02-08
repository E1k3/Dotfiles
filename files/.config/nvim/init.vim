" Vim-Plug plugin directory
call plug#begin('~/.config/nvim/plugins')

" Folding
Plug 'tmhedberg/SimpylFold'

" Read&Write through sudo
Plug 'chrisbra/SudoEdit.vim'

" Status line
Plug 'itchyny/lightline.vim'

" Git status
Plug 'tpope/vim-fugitive'

" Surround text with tags/chars
Plug 'tpope/vim-surround'

" '.' Repeat support for plugin commands
Plug 'tpope/vim-repeat'

" Wiki & Journal
Plug 'vimwiki/vimwiki'

" Haskell syntax highlighting
Plug 'neovimhaskell/haskell-vim'

" Haskell indentation
Plug 'itchyny/vim-haskell-indent'

" General completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" C/C++ completion
Plug 'zchee/deoplete-clang'

" Python completion
Plug 'zchee/deoplete-jedi'

" Visual undo tree
Plug 'mbbill/undotree'

" Color highlighting
Plug 'chrisbra/Colorizer'

" Theme
Plug 'rhriskempson/base16-vim'

call plug#end()

set nocompatible
filetype plugin indent on

" Colorscheme
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

syntax on

set directory=~/.cache/neovim,.
set encoding=utf-8

set nu
set cursorline
set ruler
set relativenumber
set laststatus=2
set scrolloff=3
set showmode
set showcmd

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

let mapleader="\\"
map <Space> <Leader>

" Navigate through completion candidates using Tab
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
" Close preview split when completion is done
autocmd CompleteDone * pclose!

" German keyboard layout utility maps
map ö [
map ä ]
map Ö {
map Ä }

" Clipboard maps
nnoremap <Leader>p "+p

" Surround maps
nnoremap <Leader>s ysiw

" Undo tree toggle
nnoremap <Leader>rr :UndotreeToggle<CR>

" RGB highlighting 
nnoremap <Leader>c :ColorToggle<CR>

" Set lightline color scheme
let g:lightline = { 'colorscheme' : 'wombat' }

" Enable deoplete completion
let g:deoplete#enable_at_startup = 1
" Enable deoplete's smartcase detection
let g:deoplete#enable_smart_case = 1
" Set deoplete clang location
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
