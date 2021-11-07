" -- Plugins call plug#begin('~/.config/nvim/plugged')
call plug#begin()
" ---- Native LSP & auto completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" ---- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" ---- Tools
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" ---- UI & Themes
Plug 'airblade/vim-gitgutter'
Plug 'gruvbox-community/gruvbox'
call plug#end()

" -- Make vim more useful
set nocompatible

" -- Colors & syntax
syntax on
let g:gruvbox_italic=1
set background=dark
set termguicolors
colorscheme gruvbox

" -- Spaces, tabs, indendation
set smarttab
set smartindent
set nowrap

" -- Split settings
set splitbelow splitright

" -- Searching
set incsearch
set nohlsearch

" -- Folding
set foldenable
set foldlevel=99
set foldmethod=indent
nnoremap <space> za

" -- UI configuration
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
set completeopt=menuone,noselect

" ---- GitGutter function for statusline
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
"
"" ---- Statusline
set laststatus=2
set statusline=
set statusline+=\%y
set statusline+=\ %f
set statusline+=\ %r
set statusline+=\ %{GitStatus()}
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %{FugitiveStatusline()}
set statusline+=\ %l/%L
set statusline+=\ [%c]

" -- Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" -- Movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" -- Non-plugin keymappings
inoremap kj <Esc>

" -- Plugin settings and keymappings
" ---- Shortcuts for vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ---- Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" -- Lua stuff
" ---- LSP
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.ccls.setup{}
EOF

" ---- Telescope
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF
