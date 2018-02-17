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

" Colorscheme gruvbox
Plug 'morhetz/gruvbox'

call plug#end()

set nocompatible
filetype plugin indent on

set background=light 
set termguicolors

colorscheme gruvbox
let g:gruvbox_bold='1'
let g:gruvbox_italic='1'
let g:gruvbox_underline='1'
let g:gruvbox_undercurl='1'
let g:gruvbox_contrast_light='hard'

let g:lightline = { 'colorscheme' : 'gruvbox' }

syntax on

set encoding=utf-8
set hidden
set directory=$HOME/.cache/neovim,.

set path+=**
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set inccommand=nosplit

set nu
set cursorline
set ruler
set laststatus=2
set scrolloff=3
set showmode
set showcmd

set visualbell
set backspace=indent,eol,start
set undofile
set nolist

set textwidth=0
set wrapmargin=0
set wrap
set linebreak

set autoindent
set tabstop=4
set shiftwidth=4

let mapleader="\\"
map <Space> <Leader>

" Close preview split when completion is done
autocmd CompleteDone * pclose!
" If completions matches word, close popup AND add newline
inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<CR>" : "\<CR>"

" German keyboard layout utility maps
nnoremap ö [
nnoremap ä ]
nnoremap Ö <c-[>
nnoremap Ä <c-]>

" Clipboard maps
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nnoremap <Leader>yy "+yy

" Surround maps
nnoremap <Leader>s ysiw

" Undo tree toggle
nnoremap <Leader>rr :UndotreeToggle<CR>

" RGB highlighting 
nnoremap <Leader>c :ColorToggle<CR>

" Enable deoplete completion
let g:deoplete#enable_at_startup = 1
" Enable deoplete's smartcase detection
let g:deoplete#enable_smart_case = 1
" Set deoplete clang location
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'

" Set vimwiki template settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/vimwiki/html/', 'template_path': '~/vimwiki/templates/', 'template_default': 'default', 'template_ext': '.html', 'auto_toc': '1'}]
