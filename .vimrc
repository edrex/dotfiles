let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set dir=~/.tmp
set backupdir=~/.tmp
set nocompatible               " be iMproved
set autowrite				" autosave current on :make (also used by vim-go)

call plug#begin('~/.vim/plugged')
  Plug 'jceb/vim-orgmode'
  Plug 'tpope/vim-speeddating'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'jreybert/vimagit'
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

set tabstop=2
set shiftwidth=2
set noexpandtab

set mouse=a
set ttymouse=xterm2
syntax on

" https://askubuntu.com/questions/60200/how-to-copy-data-between-different-instances-of-vim
set clipboard=unnamedplus
set background=dark

" switch to existing buffer in nerdtree
" au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
"                      \ exe "normal g'\"" | endif

" map <leader>t :FuzzyFinderTextMate<CR>
map <leader>t :tabe 
map <leader>q :source ~/.vimrc<cr>
map <leader>c :tabe ~/.vimrc<cr>
map <leader>B :PlugInstall<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" map <leader>T :BuffergatorTabsToggle<CR>
" map <leader>b :BuffergatorToggle<CR>
" map <leader>d :NERDTreeTabsToggle<CR>
" map <leader>r :NERDTreeFind<cr>
" map <leader>F :Ack 
" map <leader>= :ZoomWin<CR> 
" map <leader>j :setf javascript<CR> 

" single click for dirs, double for files
" let g:NERDTreeMouseMode=2

" let ruby_space_errors = 1
" let ruby_operators = 1

au BufRead,BufNewFile *.erb setfiletype javascript
