" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

set encoding=utf-8
set hidden
set number relativenumber
set termguicolors

call plug#begin('~/.vim/plugged')

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" themes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

colorscheme gruvbox
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
