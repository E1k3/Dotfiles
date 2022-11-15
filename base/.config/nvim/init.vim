" Vim-Plug plugin directory
call plug#begin('~/.config/nvim/plugins')

" Completion
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

" Utility
" Command aliases
Plug 'Konfekt/vim-alias'
" Netrw extension
Plug 'tpope/vim-vinegar'
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

set background=dark 
set termguicolors

colorscheme gruvbox
let g:gruvbox_bold='1'
let g:gruvbox_italic='1'
let g:gruvbox_underline='1'
let g:gruvbox_undercurl='1'
let g:gruvbox_contrast_dark='hard'

let g:lightline = { 'colorscheme' : 'gruvbox' }

syntax on

set encoding=utf-8
set hidden
set directory=$HOME/.cache/neovim,.

set path+=**
set wildignore+=**/.mypy_cache/**
set wildignore+=**/__pycache__/**
set wildignore+=**/.git/**
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
set cinoptions+=(0
set tabstop=4
set shiftwidth=4

set mouse=

let g:markdown_fenced_languages = ['html', 'python', 'cpp', 'c', 'bash=sh']

autocmd FileType python setlocal foldmethod=indent
autocmd FileType python normal zR

autocmd FileType c,cpp,python,java setlocal colorcolumn=80

autocmd FileType tex setlocal spelllang=en_gb spell

nnoremap <Space> <Nop>
let mapleader=" "

" Quickfix and location window maps
nnoremap <Leader>co :cwindow<CR>
nnoremap <Leader>cc :cclose<CR>:lclose<CR>

" Clipboard maps
nnoremap <Leader>p :put +<CR>
nnoremap <Leader>P :put! +<CR>
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nnoremap <Leader>yy "+yy

" Undo tree toggle
nnoremap <Leader>rr :UndotreeToggle<CR>

" RGB highlighting 
nnoremap <Leader>c :ColorToggle<CR>

" Netrw settings
nnoremap <Leader>e :Ex!<CR>
let g:netrw_liststyle=3
let g:netrw_preview=1
nmap - <Plug>VinegarVerticalSplitUp

" Asyncomplete config
let g:asyncomplete_smart_completion=1
let g:asyncomplete_auto_popup=1
let g:asyncomplete_remove_duplicates=1

inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"

" Asyncomplete sources
" Buffer
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'priority': -1,
    \ }))
" File & directory names
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 0,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
" C/C++ LSP
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp']
        \ })
endif
" Python LSP
if executable('pylsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'whitelist': ['python']
        \ })
endif
" Rust LSP
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust']
        \ })
endif
" Go LSP
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
endif

" LSP config
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_diagnostics_highlights_enabled=0
let g:lsp_highlight_references_enabled=1
let g:lsp_text_edit_enabled=0

let g:lsp_diagnostics_signs_enabled=1
let g:lsp_diagnostics_signs_error={'text': 'E'}
let g:lsp_diagnostics_signs_warning={'text': 'W'}
let g:lsp_diagnostics_signs_information={'text': 'I'}
let g:lsp_diagnostics_signs_hint={'text': 'H'}

" LSP maps
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	" Jumps to def/impl/decl
    nmap <buffer> <Leader>ld <Plug>(lsp-definition)
    nmap <buffer> <Leader>li <Plug>(lsp-implementation)
    nmap <buffer> <Leader>lt <Plug>(lsp-type-definition)
	" Rename symbol
    nmap <buffer> <Leader>ln <Plug>(lsp-rename)
	" Reformat file
    nmap <buffer> <Leader>lf <Plug>(lsp-document-format)
	" Show hover
    nmap <buffer> <Leader>lh <Plug>(lsp-hover)
	" Next reference
    nmap <buffer> <Leader>lr <Plug>(lsp-next-reference)
	" List references
    nmap <buffer> <Leader>llr <Plug>(lsp-references)
	" List errors
    nmap <buffer> <Leader>le <Plug>(lsp-document-diagnostics)
	" Jump to errors
    nmap <silent> <buffer> [e <Plug>(lsp-previous-diagnostic)
    nmap <silent> <buffer> ]e <Plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Set vimwiki template settings
let wiki={}
let wiki.path='~/vimwiki/'
let wiki.path_html='~/vimwiki/html/'
let wiki.template_path='~/vimwiki/templates/'
let wiki.template_default='default'
let wiki.template_ext='.html'
let wiki.auto_toc=1
let wiki.nested_syntaxes={'c++':'cpp', 'php':'php', 'python':'python'}
let g:vimwiki_list=[wiki]
