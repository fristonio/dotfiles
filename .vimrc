" Mapping leader key
" With mapping leader key we can add extra key combination
let mapleader = ","
let g:mapleader = ","

map <leader>s :source ~/.vimrc<CR>

" Enable filetype plugins and indentation
filetype indent on
filetype plugin on

syntax on
colorscheme afterglow
" Other themes to be used : Tomorrow-Night, atom-dark-256 afterglow dracula

" set color scheme to be 256 color rather than 16 color pallete
set t_Co=256

" Set default font for vim
set guifont=Menlo\ Regular:h18

" Set numbering of lines
set number

" Set realive numbering
set relativenumber

" Always show current position
set ruler

" Add a colored column at 90 to avoid going to far to the right
set colorcolumn=90


" Vim indentation

set nowrap
set smartindent

" Speeding up vim

set hidden

" Set how many lines of history vim has to remember
set history=700
