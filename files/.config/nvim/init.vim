" Vim-Plug plugin directory
call plug#begin('~/.config/nvim/plugins')

" Completion
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
" LSP client
Plug 'prabirshrestha/vim-lsp'

" Highlighting and code style
" GLSL syntax highlighting
Plug 'tikhomirov/vim-glsl'
" Haskell syntax highlighting
Plug 'neovimhaskell/haskell-vim'
" Haskell indentation
Plug 'itchyny/vim-haskell-indent'

" UI
" Status line
Plug 'itchyny/lightline.vim'
" Colorscheme gruvbox
Plug 'morhetz/gruvbox'

"Utility
" Git
Plug 'tpope/vim-fugitive'
" Surround text with tags/chars
Plug 'tpope/vim-surround'
" '.' Repeat support for plugin commands
Plug 'tpope/vim-repeat'
" Faster navigation (like f/t but with 2 characters)
Plug 'justinmk/vim-sneak'
" Wiki & Journal
Plug 'vimwiki/vimwiki'
" Visual undo tree
Plug 'mbbill/undotree'
" Color code highlighting
Plug 'chrisbra/Colorizer'

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
set completeopt+=preview

set nu
set cursorline
set ruler
set laststatus=2
set scrolloff=5
set pumheight=10
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

" Clipboard maps
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nnoremap <Leader>yy "+yy

" Undo tree toggle
nnoremap <Leader>rr :UndotreeToggle<CR>

" RGB highlighting 
nnoremap <Leader>c :ColorToggle<CR>

" Asyncomplete config
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_remove_duplicates = 1

" Asyncomplete sources
" Buffer
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))
" File & directory names
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
" C/C++ LSP
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
" Python LSP
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" Set vimwiki template settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/vimwiki/html/', 'template_path': '~/vimwiki/templates/', 'template_default': 'default', 'template_ext': '.html', 'auto_toc': '1'}]
