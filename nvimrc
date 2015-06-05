call plug#begin('~/.nvim/bundle')

Plug 'kien/ctrlp.vim'

call plug#end()


let mapleader = ","



let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ---- Basic settings ----
set relativenumber
set number
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" ---- Basic operations ----
" Saving, opening and closing
nnoremap <Leader>w :update<cr>
nnoremap <Leader>n :enew<cr>
nnoremap <Leader>q :bp\|bd #<cr>
nnoremap <Leader>x :bd<cr>

" Create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>

" Bind copy to clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>y "+y

" Auto source vimrc
augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost nvimrc nested source $MYVIMRC
augroup END

" better ESC
inoremap jk <esc>


