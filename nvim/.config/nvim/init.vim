" Plugins call plug#begin('~/.config/nvim/plugged')
" Tools
call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ap/vim-css-color'
Plug 'chrisbra/csv.vim'
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" UI & Themes
Plug 'airblade/vim-gitgutter'
Plug 'gruvbox-community/gruvbox'
Plug 'nanotech/jellybeans.vim'
call plug#end()

" Make vim more useful
set nocompatible

" Colors & syntax
set termguicolors
syntax on
let g:gruvbox_italic=1
let g:gruvbox_invert_selection='0'
set background=dark
colorscheme gruvbox

" Spaces, tabs, indendation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap

" UI configuration
set laststatus=1
set encoding=utf-8
set number relativenumber
set hidden
set showcmd
filetype plugin indent on
set wildmode=longest,list,full
set lazyredraw
set showmatch
set ruler
set cursorline
highlight Comment cterm=italic

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

" Markdown autocmd and settings
" Treat all .md files as markdown
au BufNewFile,BufFilePre,BufRead *.md:
    \ set filetype=markdown
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ setlocal textwidth=80

" Plugin settings and mappings
" Shortcuts for vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Deoplete
let g:deoplete#enable_at_startup = 1
