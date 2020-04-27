" Plugins
call plug#begin('~/.config/nvim/plugged')
" Tools
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular'
Plug 'freitass/todo.txt-vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'plytophogy/vim-virtualenv'
Plug 'reedes/vim-pencil'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'
" UI & Themes
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
call plug#end()

" Make vim more useful
set nocompatible

" Colors & syntax
set termguicolors
syntax on
colorscheme gruvbox
set background=dark

" Spaces & tabs
set tabstop=4
set softtabstop=4
set expandtab

" UI configuration
set encoding=utf-8
set number relativenumber
set showcmd
filetype plugin indent on
set wildmode=longest,list,full
set lazyredraw
set showmatch
set ruler
set cursorline

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Split settings
set splitbelow splitright

" Searching
set incsearch
set nohlsearch

" Folding
set foldenable
set foldlevel=99
set foldmethod=indent
nnoremap <space> za

" Movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Shortcuts
inoremap kj <Esc>

" JavaScript, HTML, CSS indendation
au BufNewFile,BufRead *.js, *.html, *.css:
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Python settings
" PEP8 indendation
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Plugin settings and mappings
" Neovim remote
let g:vimtex_compiler_progname = 'nvr'

" Shortcuts for vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Ultisnips
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Deoplete
let g:deoplete#enable_at_startup = 1

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
