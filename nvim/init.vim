call plug#begin('~/.config/nvim/bundle')

Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'benmills/vimux'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'shime/vim-livedown'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'benekastah/neomake'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'Numkil/ag.nvim'
Plug 'floobits/floobits-neovim'
Plug 'gabesoft/vim-ags'
Plug 'airblade/vim-gitgutter'
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'
Plug 'sjl/splice.vim/'
Plug 'morhetz/gruvbox'

call plug#end()

let mapleader = ","

" ---- Basic settings ----
set relativenumber
set number
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set notimeout

" Disable mouse
set mouse=

" filetype plugin indent on

" --- Searching ---
"
" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch
set incsearch

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

set wrap
" turn off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

" Show whitespace characters
set list
set listchars=tab:.\ ,eol:¬,extends:❯,precedes:❮,trail:␣
let &showbreak = '↳ '

" Remove annoying sounds
set visualbell

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:␣
    au InsertLeave * :set listchars+=trail:␣
augroup END

" When switching buffers, preserve window view.
au BufLeave * if !&diff | let b:winview = winsaveview() | endif
au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | endif

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc

" Set up undo-, backup- and swapfiles
if has('persistent_undo')
    set undodir=~/.config/nvim/tmp/undo//     " undo files
    set undofile
    set undolevels=3000
    set undoreload=10000
endif
set backupdir=~/.config/nvim/tmp/backup// " backups
set backup
set noswapfile

" Don't use arrow keys - they shouldn't be touched in vim
nnoremap <left> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>

inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>

" ---- Basic operations ----
" better ESC
inoremap jk <esc>

set autoread
set backspace=indent,eol,start
set hidden
set history=1000
set laststatus=2
set ruler
set showcmd

" Saving, opening and closing
nnoremap <Leader>w :update<cr>
nnoremap <Leader>n :enew<cr>
nnoremap <Leader>q :bp\|bd #<cr>
nnoremap <Leader>x :bd<cr>

" Quick editing
nnoremap <leader>ev :e ~/dotfiles/nvim/init.vim<cr>
nnoremap <leader>ez :e ~/dotfiles/zshrc<cr>
nnoremap <leader>et :e ~/dotfiles/tmux.conf<cr>
nnoremap <Leader>es :UltiSnipsEdit<cr>

" Easy splitted window navigation
" Terrible workaround for <C-h> currently not working in neovim
" https://github.com/neovim/neovim/issues/2048
if has('nvim')
    nmap <BS> <C-W>h
endif
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy buffer navigation
nnoremap <C-j> :bprevious<cr>
nnoremap <C-k> :bnext<cr>

" Create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>

" Bind copy to clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>y "+y

" Multi-line moving
nnoremap j gj
nnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Disable code folding completely
set nofoldenable

" Set 3 lines to the cursor - when moving vertically
set scrolloff=3

" Set vertical bar in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Auto source vimrc
augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost init.vim nested source $MYVIMRC
augroup END


" Toggle spell checking
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>

" Remove all trailing whitespaces
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Filetype specific mapping (executing)
function! CdToFile()
    :lcd %:p:h
endfunction

nnoremap cd :call CdToFile()<cr>

" ---- Plugins ----
" Redefine fugitive keys
if hasmapto('<Leader>g')
    nunmap <leader>g
endif
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gx :Gremove<cr>
nnoremap <leader>gm :Gmove<space>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :call VimuxRunCommandInDir("git push", 0)<cr>
nnoremap <leader>gl :call VimuxRunCommandInDir("git pull", 0)<cr>

au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.rs set filetype=rust
au BufNewFile,BufRead Vagrantfile set filetype=ruby

nnoremap <Leader>rr :update<Bar>:call VimuxRunLastCommand()<cr>
nnoremap <Leader>vr :VimuxRunCommand('')<Left><Left>

autocmd Filetype tex nnoremap <buffer> <Leader>rt :update<Bar>:call VimuxRunCommandInDir('latexmk -pdf', 1)<cr>
autocmd Filetype go nnoremap <buffer> <Leader>rt :update<Bar>:call VimuxRunCommand('go test -v')<cr>
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Gruvbox    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    NerdTree    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable the scrollbars
set guioptions-=r
set guioptions-=L

" Keep NERDTree window fixed between multiple toggles
set winfixwidth
nmap <C-i> :NERDTreeToggle<cr>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Airline    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline powerline font
" https://github.com/Lokaltog/powerline-fonts/tree/master/Meslo
set guifont=Meslo\ LG\ M\ for\ Powerline:h12
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    UltiSnips    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetsDir = $HOME . '/.config/nvim/UltiSnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    YouCompleteMe    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal completeopt-=preview
let g:ycm_filetype_blacklist = {
      \ 'tex' : 1,
      \ 'markdown' : 1
      \}

autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    CtrlP    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <Leader>o :CtrlPBuffer<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Livedown    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map gm :LivedownPreview<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    CoffeeScript    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype coffee nnoremap <buffer> <leader>js :CoffeeCompile<cr>
autocmd Filetype coffee vnoremap <buffer> <leader>js :CoffeeCompile<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    TagBar    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>t :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    GoLang    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Neomake  ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_coffeescript_enabled_makers = ['coffeelint']

" Run Neomake on every file write
autocmd! BufWritePost * Neomake

" Open error window
nnoremap <leader>zz :lopen<cr>
nnoremap <leader>zn :lnext<cr>
nnoremap <leader>zp :lprev<cr>
