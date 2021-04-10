
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

set cursorline
set encoding=utf-8
set expandtab
set hidden
set list
set listchars=eol:¬,nbsp:_,tab:\ \ ,trail:·
set nobackup
set noerrorbells
set noswapfile
set nowrap
set number relativenumber
set shiftwidth=3
set showcmd
set tabstop=3 softtabstop=3
set termguicolors
set undodir=~/.vim/undodir
set undofile
set scrolloff=8

call plug#begin('~/.vim/plugged')

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" nvim-telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" close buffer without closing window
Plug 'rbgrouleff/bclose.vim'

" themes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tab markers
Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Golang support
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

let mapleader = ' '

" Initialize plugin system
call plug#end()

" treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  }
}
EOF

" telescope shortcuts
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" gopher help
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>

" colorscheme gruvbox
colorscheme spacemacs-theme
set background=dark
let g:gruvbox_contrast_dark = 'soft'

" airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline_detect_modified = 1
let g:airline_inactive_collapse = 1

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.maxlinenr = ''

" identLine plugin
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_defaultGroup = 'SpecialKey'

" Redraws the screen and removes any search highlighting.
nnoremap <silent> <c-l> :nohl<cr><c-l>

" empty all registers
fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun
:command! EmptyRegisters :call EmptyRegisters()
