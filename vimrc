" Most commands adopted from vimified (https://github.com/zaiste/vimified/)
set nocompatible
filetype on
filetype off
set modelines=0

" Vundle Installation
let vundleInstalled = 1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')

if !filereadable(vundle_readme)
    let vundleInstalled=0
    echo "Installing Vundle ..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tomasr/molokai'
Bundle 'SirVer/ultisnips'
Bundle 'kien/ctrlp.vim'
Bundle 'hpurmann/vimux'

if vundleInstalled == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Vundle Installation end

filetype plugin indent on
syntax on

let mapleader = ","
let maplocalleader = "\\"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Custom functions    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetype specific mapping (executing)
function! CdToFile()
    :lcd %:p:h
endfunction

function! VimuxRunCommandInDir(command, useFile)
    let l:file = ""
    if a:useFile ==# 1
        let l:file = shellescape(expand('%:t'), 1)
    endif
    call VimuxRunCommand("cd ".shellescape(expand('%:p:h'), 1)." && ".a:command." ".l:file)
endfunction

" It defines where to look for the buffer user demanding (current window, all
" windows in other tabs, or nowhere, i.e. open file from scratch every time) and
" how to open the buffer (in the new split, tab, or in the current window).

" This orders Vim to open the buffer.
set switchbuf=useopen
set relativenumber
set number
set autoindent
set tabstop=4
set softtabstop=4
"set textwidth=80
set shiftwidth=4
set expandtab
set wrap
set formatoptions=qrn1

" Show whitespace characters
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

" Mark lines which are too long
" augroup vimrc_autocmds
  " autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
  " autocmd BufEnter * match OverLength /\%75v.*/
" augroup END

" Remove timeout when going back to normal mode
set notimeout
set ttimeout
set ttimeoutlen=10

" Remove annoying sounds
set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

" Set up undo-, backup- and swapfiles
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

" === Searching === {{{

" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch
set incsearch

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
" }}}

" Don't use arrow keys - they shouldn't be touched in vim
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Easy splitted window navigation
" noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

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

" Disable code folding completely
set nofoldenable

" Set 3 lines to the cursor - when moving vertically
set scrolloff=3

" Mappings {{{

augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost vimrc nested source $MYVIMRC
augroup END

" if $TMUX == ''
    " set clipboard+=unnamed
" endif

" Saving and closing
nnoremap <Leader>w :update<cr>
nnoremap <Leader>q :bd<cr>

" Quick editing
nnoremap <leader>ev :e ~/dotfiles/vimrc<cr>
nnoremap <leader>ez :e ~/dotfiles/zshrc<cr>
nnoremap <leader>et :e ~/dotfiles/tmux.conf<cr>
nnoremap <Leader>es :UltiSnipsEdit<cr>

" Easy buffer navigation
noremap <C-h> :bprevious<cr>
noremap <C-l> :bnext<cr>

" Bind copy to clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y

" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>

nnoremap cd :call CdToFile()<cr>
nnoremap <Leader>cd :call VimuxRunCommandInDir(":", 0)<cr>

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
" Indentation of whole file
map <F7> mzgg=G`z

" Toggle spell checking
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>

nnoremap j gj
nnoremap k gk

" Redefine Janus' fugutive keys
if hasmapto('<Leader>g')
    nunmap <leader>g
endif
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :call VimuxRunCommandInDir("git push", 0)<cr>
nnoremap <leader>ga :Gwrite<cr>


autocmd Filetype sml nnoremap <buffer> <Leader>rr :update<Bar>:call CdToFile()<bar>execute '!sml < '.shellescape(@%, 1)<cr>
autocmd Filetype markdown nnoremap <buffer> <Leader>rr :update<Bar>:call CdToFile()<bar>execute '!pandoc '.shellescape(@%, 1).' -o '.shellescape(expand('%:r'), 1).'.pdf'<cr>
"}}}
autocmd Filetype tex nnoremap <buffer> <Leader>rr :update<Bar>:call VimuxRunCommandInDir('latexmk -pdf', 1)<cr>
nnoremap <silent> <Leader>rt :update<Bar>:call VimuxRunCommand('cd ~/dev/compilation/handins/03-parsing && make standalone && mv tigerc.x86-darwin tigerc.x86-linux && ./tigerc '.shellescape(expand('%:t:r'), 1))<cr>


au BufNewFile,BufRead *.tig so ~/dotfiles/vim/syntax/tiger.vim
au BufNewFile,BufRead *.grm  setf sml

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    PLUGINS    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    NerdTree    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable the scrollbars
set guioptions-=r
set guioptions-=L

" Keep NERDTree window fixed between multiple toggles
set winfixwidth
nmap <C-i> :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    UltiSnips    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetsDir = $HOME . '/dotfiles/vim/UltiSnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    NERDCommenter    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>cc :call NERDComment(0, "invert")<cr>
nnoremap <leader>cc :call NERDComment(0, "invert")<cr>
vnoremap <leader>cc :call NERDComment(0, "invert")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     ***    Molokai    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" During installation the molokai colorscheme might not be avalable
if filereadable(globpath(&rtp, 'colors/molokai.vim'))
    colorscheme molokai
else
    colorscheme default
endif

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
"                     ***    CtrlP    ***
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <Leader>o :CtrlP<cr>
let g:ctrlp_use_caching = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Sane Ignore For ctrlp
" let g:ctrlp_custom_ignore = {
    " \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
    " \ 'file': '\.exe$\|\.so$\|\.dat$'
    " \ }
