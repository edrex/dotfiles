let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set dir=~/.tmp
set backupdir=~/.tmp
set nocompatible               " be iMproved
set autowrite				" autosave current on :make (also used by vim-go)

call plug#begin('~/.vim/plugged')
  Plug 'jceb/vim-orgmode'
  Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-surround'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'jreybert/vimagit'
	Plug 'junegunn/goyo.vim'
	Plug 'vimwiki/vimwiki'

" Plug 'tpope/vim-fugitive'
" Plug 'L9'
" Plug 'JavaScript-Indent'
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'jeetsukumaran/vim-buffergator'

" Plug 'mileszs/ack.vim'
" Plug 'ZoomWin'
" Plug 'rson/vim-conque'
  Plug 'jamessan/vim-gnupg'

call plug#end()

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.markdown'}]
set tabstop=2
set shiftwidth=2
set noexpandtab

set mouse=a
" set ttymouse=xterm2
syntax on

" https://askubuntu.com/questions/60200/how-to-copy-data-between-different-instances-of-vim
set clipboard=unnamedplus
set background=dark

map <leader>t :tabe 
map <leader>q :source ~/.vimrc<cr>
map <leader>c :tabe ~/.vimrc<cr>
map <leader>B :PlugInstall<CR>

nnoremap <F2> :set invpaste paste?<CR>
map <leader>p :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
