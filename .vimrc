set nocompatible
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""
" Vundle Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""

" Disable filetype for Vundle
filetype off

" Set runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle to manage Vundle
Plugin 'gmarik/Vundle.vim'

" Gruvbox vim theme
Plugin 'morhetz/gruvbox'

" NerdTree Plugin for vim for tree exploration
Plugin 'scrooloose/nerdtree'

" GitGutter Plugin to see git diff in real time
Plugin 'airblade/vim-gitgutter'

" SuperTab Vim Plugin

Plugin 'ervandew/supertab'

" CTRLP vim 

Plugin 'ctrlpvim/ctrlp.vim'

" EditorConfig plugin

Plugin 'editorconfig/editorconfig-vim'

" Vim Autoclose for paranthesis and bracktes

Plugin 'townk/vim-autoclose'

" Fast File navigation for vim

Plugin 'wincent/command-t'

call vundle#end()
filetype plugin indent on
"""" End Vundle Configuration

"""""""""""""""""""""""""""""""""""""""""""
" Vundles plugins configuration
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""
" NerdTree
"""""""""""""""""

" Open NERDTree when vim starts up with no file type specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NerdTree  automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


"""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""

" Mapping leader key
" With mapping leader key we can add extra key combination
let mapleader = ";"
let g:mapleader = ";"

map <leader>s :source ~/.vimrc<CR>

" Ctrl+n to toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" Enable filetype plugins and indentation
filetype indent on
filetype plugin on

syntax on
colorscheme gruvbox
set background=dark  " Setting dark mode
" Other themes to be used : Tomorrow-Night, atom-dark-256 afterglow dracula
" gruvbox

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

" Highlight the current line on which the cursor is
set cursorline

" Display the status line always
set laststatus=2

" Vim indentation

" set nowrap
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Speeding up vim

set hidden

" Set how many lines of history vim has to remember
set history=700

