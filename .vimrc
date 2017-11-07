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

" Vim-airline plugin
Plugin 'vim-airline/vim-airline'

" A vim fuzzy finder
Plugin 'junegunn/fzf'

" Vim Emmet
Plugin 'mattn/emmet-vim'

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

" Vim Airline 

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename of the buffer
let g:airline#extensions#tabline#fnamemod = ':t'

let g:user_emmet_leader_key=','
let g:user_emmet_mode='inv'

" To restrict the number of characters in buffer-name in ariline

function! airline#extensions#tabline#get_buffer_name(nr)
  let name = bufname(a:nr)
  let label = a:nr . ' '

  if empty(name)
    let label .= '[No Name]'
  else
    let label .= fnamemodify(name, ':t')
  endif

  if getbufvar(a:nr, '&modified') == 1
    let label .= '[+]'
  endif
  
  if strlen(label) > 25
    let label = label[0:25] . '...'
  endif
  return label
endfunction

" CtrlP vim

" Set searching for CtrlP resticted to current working directory
let g:ctrlp_working_path_mode = 0


" Syntastic Configuration

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""

" Mapping leader key
" With mapping leader key we can add extra key combination
let mapleader = ";"
let g:mapleader = ";"

" Set the timeout for the maaped key to be pressed
set timeoutlen=300

map <leader>r :source ~/.vimrc<CR>

" Ctrl+n to toggle nerdtree
" NerdTree is a new window so to toggle use Ctrl+w
map <C-n> :NERDTreeToggle<CR>

" Enable filetype plugins and indentation
filetype indent on
filetype plugin on

syntax on            " Turn ColorScheme on for syntax highlighting   
colorscheme gruvbox  " ColorScheme
set background=dark  " Setting dark mode for gruvbox
" Other themes to be used : Tomorrow-Night, atom-dark-256 afterglow dracula
" gruvbox

" set color scheme to be 256 color rather than 16 color pallete
set t_Co=256

" Change gutter column width of number column 
set nuw=5

" This option determines the number of context lines you would like to see
" above and below the cursor
set scrolloff=10

" Restrict vim from creating swp files
set noswapfile

" Set default font for vim
set guifont=Menlo\ Regular:h18

" Set numbering of lines
set number

" Set relative numbering 
set relativenumber

" Always show current position
set ruler

" Add a colored column at 90 to avoid going to far to the right
set colorcolumn=120

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


""""""""""""""""""""""""""""""""""""""""
" VIM Keybindings
""""""""""""""""""""""""""""""""""""""""

" CTRL+c to exit insert mode and go to normal mode

" Map <leader>s(;s) to save the current file opened in Vim and <leader>sa to
" save all write all changed files and keep working
noremap <leader>s :update<CR>
vnoremap <leader>s <C-C>:update<CR>
inoremap <leader>s <C-O>:update<CR>

noremap <leader>sa :wa<CR>
inoremap <leader>sa <C-O>:wa<CR>

" Map <leader>w(;w) to save and quit the current file opened in Vim and
" <leader>wa to write all files and quit
noremap <leader>w :wq<CR>
vnoremap <leader>w <C-C>:wq<CR>
inoremap <leader>w <C-O>:wq<CR>

noremap <leader>wa :xa<CR>
inoremap <leader>wa <C-O>:xa<CR>

" Map <leader>q(;q) to quit the current file opened in Vim
noremap <leader>q :q<CR>
vnoremap <leader>q <C-C>:q<CR>
inoremap <leader>q <C-O>:q<CR>

" SET Up buffers for vim

" Open a new empty buffer
noremap <leader>t :enew<CR>
inoremap <leader>t <C-O>f:enew<CR>

" Navigation between buffers <leader>h for previous buffer and <leader>l for
" next buffer
noremap <leader>h :bprevious<CR>
inoremap <leader>h <C-O>:bprevious<CR>

noremap <leader>l :bnext<CR>
inoremap <leader>l <C-O>:bnext<CR>

" Close the current buffer and move to the previous one
noremap <leader>bc :bp <BAR> bd #<CR>
inoremap <leader>bc <C-O>:bp <BAR> bd #<CR>

" Mapping to move lines

nnoremap <leader>d :m+1<CR>
nnoremap <leader>u :m-2<CR>
inoremap <leader>d <C-O>:m+1<CR>
inoremap <leader>u <C-O>:m-2<CR>
vnoremap <leader>d :m '>+1<CR>gv=gv
vnoremap <leader>u :m '<-2<CR>gv=gv

" Keybindings for move to matching brace, use <leader>m for the purpose
noremap <leader>m %
inoremap <leader>m <C-O>%

" Append to the end of the line
noremap <leader>a A
inoremap <leader>a <C-O>A

" Map a keybinding to escape
noremap <leader>z <Esc>
inoremap <leader>z <Esc>
