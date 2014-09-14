" File inspired by vimified (https://github.com/zaiste/vimified/)
set nocompatible
filetype on
filetype off
set modelines=0

let mapleader = ","
let maplocalleader = "\\"

" Setting up Vundle - the vim plugin bundler
let vundleInstalled=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vundleInstalled=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Add your bundles here
Bundle 'https://github.com/tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

" Keep NERDTree window fixed between multiple toggles
set winfixwidth
nmap <C-i> :NERDTreeToggle<cr>
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdcommenter'
map <leader>c :call NERDComment(0, "invert")<cr>
nmap <leader>c :call NERDComment(0, "invert")<cr>
vmap <leader>c :call NERDComment(0, "invert")<cr>
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-surround'

" Color
Bundle 'tomasr/molokai'
" During installation the molokai colorscheme might not be avalable
if filereadable(globpath(&rtp, 'colors/molokai.vim'))
    colorscheme molokai
else
    colorscheme default
endif

if vundleInstalled == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on
syntax on
" Relative line numbers
set relativenumber
set number
" It defines where to look for the buffer user demanding (current window, all
" windows in other tabs, or nowhere, i.e. open file from scratch every time) and
" how to open the buffer (in the new split, tab, or in the current window).

" This orders Vim to open the buffer.
set switchbuf=useopen

set autoindent
set tabstop=4
set softtabstop=4
set textwidth=80
set shiftwidth=4
set expandtab
set wrap
set formatoptions=qrn1

" Show whitespace characters
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

if has('persistent_undo')
    set undodir=~/.vim/tmp/undo//     " undo files
    set undofile
    set undolevels=3000
    set undoreload=10000
endif
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:␣
    au InsertLeave * :set listchars+=trail:␣
augroup END

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END
" }}}


" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Easy splitted window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" better ESC
inoremap jj <esc>

set autoread
set encoding=utf-8
set backspace=indent,eol,start
set hidden
set history=1000
set laststatus=2
set ruler
set showcmd

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Say no to code folding
set nofoldenable

" Airline powerline font
" https://github.com/Lokaltog/powerline-fonts/tree/master/Meslo
set guifont=Meslo\ LG\ M\ for\ Powerline:h12
let g:airline_powerline_fonts = 1

" Set 3 lines to the cursor - when moving vertically
set scrolloff=3

" Mappings {{{

nnoremap ; :
" http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
"command -nargs=0 -bar Update if &modified
"\|    if empty(bufname('%'))
"\|        browse confirm write
"\|    else
"\|        confirm write
"\|    endif
"\|endif
"nnoremap <silent> <C-S> :<C-u>Update<cr>
"inoremap <c-s> <c-o>:Update<cr>
map <C-v> "+p
vmap <C-c> "+y

augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost ~/dotfiles/vimrc nested source $MYVIMRC
augroup END

if $TMUX == ''
    set clipboard+=unnamed
endif

map <Leader>w :update<cr>
nnoremap <Leader>q <esc>:bd<cr>
nnoremap <Leader>ev <esc>:e ~/dotfiles/vimrc<cr>
nnoremap <Leader>ez <esc>:e ~/dotfiles/zshrc<cr>
nnoremap <Leader>et <esc>:e ~/dotfiles/tmux.conf<cr>
" Easy buffer navigation
noremap <C-h> :bprevious<cr>
noremap <C-l> :bnext<cr>

" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" Routines
" Macro for indentation of whole file
map <F7> mzgg=G`z

" Redefine Janus' fugutive keys
if hasmapto('<Leader>g')
    nunmap <leader>g
endif
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>ga :Gwrite<cr>

autocmd Filetype sml nnoremap <buffer> <Leader>rr <esc>:update<Bar>execute '!sml < '.shellescape(@%, 1)<cr>
autocmd Filetype markdown nnoremap <buffer> <Leader>rr <esc>:update<Bar>execute '!pandoc '.shellescape(@%, 1).' -o '.shellescape(expand('%:r'), 1).'.pdf'<cr>
"}}}

au BufNewFile,BufRead *.tig so ~/.vim/tiger.vim
