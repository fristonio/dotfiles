set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set backspace=indent,eol,start

" To use ALE with COC
let g:ale_disable_lsp = 1

" Setup vim plug
let vimplug_exists=expand('~/./autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"""""""""""""""""""""""""""""""""""""""""
" Vim Plug Configuration
"""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
" Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'preservim/tagbar'

Plug 'tpope/vim-rhubarb'

" VIM theme packs
Plug 'joshdick/onedark.vim'
" Plug 'rakr/vim-one'
" Plug 'morhetz/gruvbox'
" Plug 'chriskempson/base16-vim'

Plug 'airblade/vim-gitgutter'
Plug 'powerline/powerline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'townk/vim-autoclose'

" This plugin needs ruby support
" Plug 'wincent/command-t'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-rooter'
Plug 'ervandew/supertab'

Plug 'Yggdroot/indentLine'

" To highlight word under the cursor.
Plug 'RRethy/vim-illuminate'

" Terraform plugin for vim
Plug 'hashivim/vim-terraform'

Plug 'nix-community/rnix-lsp'

Plug 'earthly/earthly.vim', { 'branch': 'main' }

if has('python')
    Plug 'puremourning/vimspector'
endif

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'

"" Snippets
" Plug 'honza/vim-snippets'

" Language specific plugins
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" Rust language packages.
" rustup component add rust-src -> To add rust source
Plug 'rust-lang/rust.vim'

" Plugin for icons in Vim, disable this if there is no UTF8 support
Plug 'ryanoasis/vim-devicons'

" Language plugin for Ziglang
Plug 'ziglang/zig.vim'

" Plugin to adhere to linux kernel style
Plug 'vivien/vim-linux-coding-style'
" Cue lang support for vim
Plug 'jjo/vim-cue'
Plug 'plasticboy/vim-markdown'

" Keeps a stack of Vim yanks
Plug 'maxbrunsfeld/vim-yankstack'

" For language syntax highlighting
Plug 'sheerun/vim-polyglot'

" LSP support
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Required:
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""
" Vundles plugins configuration
"""""""""""""""""""""""""""""""""""""""""""
" Enable truecolor support for vim
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Mapping leader key
" With mapping leader key we can add extra key combination
let mapleader = ";"
let g:mapleader = ";"
" Set the timeout for the maaped key to be pressed
set timeoutlen=300

syntax on
set ruler
set number
syntax enable
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1

" Configure theme
colorscheme onedark
set background=dark
" colorscheme base16-atelier-dune

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F
set list

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Configuer ctags file
" set tags=./tags;/
set tags=./tags,tags;

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Vim COC
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Vim Rooter
let g:rooter_manual_only = 1

" Vim Markdown
let g:vim_markdown_new_list_item_indent = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
autocmd FileType markdown set textwidth=79

"""""""""""""""""
" Vim indentLine
"""""""""""""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
set list lcs=tab:\ \ ┊,space:·
hi SpecialKey ctermfg=236 guifg=grey21

"""""""""""""""""
" Vim Airline
"""""""""""""""""
let g:airline_theme = 'onedark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"""""""""""""""""
" NerdTree
"""""""""""""""""
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" Open NerdTree  automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close nerdtree when it is the lst window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


nnoremap <leader>n :NERDTreeFind<CR>
inoremap <leader>n <C-O>:NERDTreeFind<CR>
vnoremap <leader>n <C-C>:NERDTreeFind<CR>

""""""""""""""""""""""""""""
" grep.vim configuration
""""""""""""""""""""""""""""
nnoremap <silent> <leader>f :Ag<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules vendor'

""""""""""""""""""
" CtrlP vim
""""""""""""""""""
" Set searching for CtrlP resticted to current working directory
let g:ctrlp_working_path_mode = 0

" File and directories ignore for ctrl-p
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.svn|node_modules|vendor|venv)',
    \ 'files': '\v\.(o|so|test|swp|tmp)$'
    \ }

" Emulate Terminal within vim.
nnoremap <silent> <leader>sh :terminal<CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --path-to-ignore ~/.agignore -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

let g:ag_working_path_mode="r"

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" ale
let g:ale_fix_on_save = 1
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

" Tagbar
nmap <silent> <C-t> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
set clipboard^=unnamed,unnamedplus

"""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""
" Function to setup wrapping.
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

set textwidth=119

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread


"""""""""""""""""""""""""""""""""""""""""""
" Mapping Section
"""""""""""""""""""""""""""""""""""""""""""
map <leader>r :source ~/.vimrc<CR>

" Ctrl+n to toggle nerdtree
" NerdTree is a new window so to toggle use Ctrl+w
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" Enable filetype plugins and indentation
filetype indent on
filetype plugin on

" Change gutter column width of number column
set nuw=5

" This option determines the number of context lines you would like to see
" above and below the cursor
set scrolloff=10

" Restrict vim from creating swp files
" set noswapfile

" // at the end of the directory will store the files using full paths so
" file with same names in different directories do not conflict with each
" other.
" set directory=~/.vim/.swap//
" set backupdir=~/.vim/.backup//

" session management
let g:session_directory = "~/./session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Set numbering of lines
set number

" Add a colored column at 90 to avoid going to far to the right
set colorcolumn=120

" Highlight the current line on which the cursor is
set cursorline

" Vim indentation
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set smartindent
set autoindent

set fileformats=unix,dos,mac

" Speeding up vim
set hidden

" Set how many lines of history vim has to remember
set history=700

" Turn on wildmenu
set wildmenu

" Set to autoread when a file is changed from outside
set autoread

set magic

" Set buffer to modifiable fix error with nerdtree to create a new npde's
set modifiable
set nowrap
set nojoinspaces

set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.


""""""""""""""""""""""""""""""""""""""""
" VIM Keybindings
""""""""""""""""""""""""""""""""""""""""
" CTRL + c to exit insert mode and go to normal mode
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" CTRL + BackSpace for killing previous word
noremap <C-BS> db
inoremap <C-BS> <C-O>db

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

noremap <C-q> :q<CR>
vnoremap <C-q> <C-C>:q<CR>
inoremap <C-q> <C-O>:q<CR>

" Setup Tabs for vim
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" SET Up buffers for vim

" Open a new empty buffer
" noremap <leader>t :enew<CR>
" inoremap <leader>t <C-O>f:enew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Neat X clipboard integration
" ;p will paste clipboard into buffer
" ;c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -i -s <CR><CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Navigation between buffers <leader>h for previous buffer and <leader>l for
" next buffer
noremap <leader>k :bprevious<CR>
inoremap <leader>k <C-O>:bprevious<CR>

noremap <leader>j :bnext<CR>
inoremap <leader>j <C-O>:bnext<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Close the current buffer and move to the previous one
noremap <leader>c :bp <BAR> bd #<CR>
inoremap <leader>c <C-O>:bp <BAR> bd #<CR>

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

" go to the end of the line
noremap <leader>a A
inoremap <leader>a <C-O>A

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>
inoremap <silent> <leader><space> <C-O>:noh<cr>

"" Switching windows
" For moving up and down use C-w j or C-w k
noremap <C-d> <C-w>j
noremap <C-u> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"*****************************************************************************
"" Custom Language configs
"*****************************************************************************
" COC generic configuration
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" go
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_def_mode = "gopls"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_auto_type_info = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go nmap <Leader>i <Plug>(go-info)

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

" ale
:call extend(g:ale_linters, {
    \"go": ['golint', 'go vet'], })

autocmd FileType go set textwidth=120

" haskell
let g:haskell_conceal_wide = 1
let g:haskell_multiline_strings = 1
let g:necoghc_enable_detailed_browse = 1
autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END


" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" rust
" Vim racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)

" Linux kernel formatting
function LinuxFormatting()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab
endfunction

let g:linuxsty_patterns = [ "bpf", "kernel-upstream", "linux" ]
" set cinoptions=:0(0u0w1W1m1
