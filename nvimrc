call plug#begin('~/.nvim/bundle')

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'

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

set wrap
" turn off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

" Show whitespace characters
set list
set listchars=tab:.\ ,eol:¬,extends:❯,precedes:❮,trail:␣
let &showbreak = '↳ '

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc

set wildmenu
" zsh style autocomplete menu
" (practical vim, p. 66)
set wildmode=full

" Set up undo-, backup- and swapfiles
if has('persistent_undo')
    set undodir=~/.vim/tmp/undo//     " undo files
    set undofile
    set undolevels=3000
    set undoreload=10000
endif
set backupdir=~/.nvim/tmp/backup// " backups
set backup

" ---- Basic operations ----
" better ESC
inoremap jk <esc>

" Saving, opening and closing
nnoremap <Leader>w :update<cr>
nnoremap <Leader>n :enew<cr>
nnoremap <Leader>q :bp\|bd #<cr>
nnoremap <Leader>x :bd<cr>

" Quick editing
" TODO: Uncomment when moved to normal dotfiles
" nnoremap <leader>ev :e ~/dotfiles/vimrc<cr>
" nnoremap <leader>ez :e ~/dotfiles/zshrc<cr>
" nnoremap <leader>et :e ~/dotfiles/tmux.conf<cr>
" nnoremap <Leader>es :UltiSnipsEdit<cr>

" Easy splitted window navigation
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

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

" Set vertical bar in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Auto source vimrc
augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost nvimrc nested source $MYVIMRC
augroup END


" Toggle spell checking
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>

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
" TODO: Re-enable when vimux is installed
" nnoremap <leader>gp :call VimuxRunCommandInDir("git push", 0)<cr>
" nnoremap <leader>gl :call VimuxRunCommandInDir("git pull", 0)<cr>
