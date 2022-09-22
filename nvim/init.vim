call plug#begin('~/.config/nvim/bundle')

Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'benmills/vimux'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rdolgushin/gitignore.vim'
Plug 'Numkil/ag.nvim'
Plug 'gabesoft/vim-ags'
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'
Plug 'sjl/splice.vim/'
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
"Plug 'moll/vim-node'
Plug 'jbgutierrez/vim-babel'
Plug 'mattn/webapi-vim' " needed for vim-babel
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'dbakker/vim-projectroot'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'oesse/vim-nodegf'
Plug 'tjvr/vim-nearley'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'elixir-editors/vim-elixir'

call plug#end()

let mapleader = ","

" ---- Basic settings ----
set relativenumber
set number
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
inoremap Jk <esc>
inoremap JK <esc>

set autoread
set backspace=indent,eol,start
set hidden
set history=1000
set laststatus=2
set ruler
set showcmd
set lazyredraw

" Saving, opening and closing
nnoremap <Leader>w :update<cr>
nnoremap <Leader>n :enew<cr>
nnoremap <Leader>q :bp\|bd #<cr>
nnoremap <Leader>x :bd<cr>

" Quick editing
nnoremap <leader>ev :e ~/dotfiles/nvim/init.vim<cr>
nnoremap <leader>ez :e ~/dotfiles/zshrc<cr>
nnoremap <leader>et :e ~/dotfiles/tmux.conf<cr>

" Easy splitted window navigation
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
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.ne setfiletype nearley

nnoremap <Leader>rr :update<Bar>:call VimuxRunLastCommand()<cr>
nnoremap <Leader>vr :VimuxRunCommand('')<Left><Left>

autocmd Filetype tex nnoremap <buffer> <Leader>rt :update<Bar>:call VimuxRunCommandInDir('latexmk -pdf', 1)<cr>
autocmd Filetype go nnoremap <buffer> <Leader>rt :update<Bar>:call VimuxRunCommand('go test -v')<cr>
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype coffee setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

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
nnoremap <Tab> :NERDTreeToggle<cr>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Airline    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline powerline font
" https://github.com/Lokaltog/powerline-fonts/tree/master/Meslo
set guifont=Inconsolata\ for\ Powerline:h12
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    FZF    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <c-P> :ProjectFiles<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Markdown Preview    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map gm :MarkdownPreview<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    CoffeeScript    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype coffee nnoremap <buffer> <leader>js :CoffeeCompile<cr>
autocmd Filetype coffee vnoremap <buffer> <leader>js :CoffeeCompile<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    GoLang    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Rust    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_rust_src_path = $HOME . '/dev/rust/src'
let $RUST_SRC_PATH = $HOME . '/dev/rust/src'
let g:rustfmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    vim-projectroot    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <leader>cf :ProjectRootCD<CR><Bar> :let @+=expand("%.")<CR><Bar>:echo "Copied" @+<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***   coc-vim     ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
