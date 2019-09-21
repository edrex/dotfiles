let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set dir=~/.tmp
set backupdir=~/.tmp
set nocompatible               " be iMproved
filetype plugin on
set autowriteall				" autosave current on :make (also used by vim-go)
" write buffer when focus lost, no error for untitled
" https://vim.fandom.com/wiki/Auto_save_files_when_focus_is_lost
:au FocusLost * silent! wa

call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'

	Plug 'vimwiki/vimwiki'
	Plug 'tbabej/taskwiki'
	Plug 'blindFS/vim-taskwarrior'

	Plug 'ipod825/vim-netranger'

	Plug 'vim-airline/vim-airline'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	Plug 'tpope/vim-speeddating'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'junegunn/goyo.vim'

	Plug 'tpope/vim-fugitive'

	Plug 'ajmwagar/vim-deus'
  Plug 'jamessan/vim-gnupg'
	" Plug 'jreybert/vimagit'
  " Plug 'jceb/vim-orgmode'
  " Plug 'scrooloose/nerdtree'
	" Plug 'Xuyuanp/nerdtree-git-plugin'
	" Plug 'L9'
	" Plug 'JavaScript-Indent'
	" Plug 'jistr/vim-nerdtree-tabs'
	" Plug 'jeetsukumaran/vim-buffergator'

	" Plug 'mileszs/ack.vim'
	" Plug 'ZoomWin'
	" Plug 'rson/vim-conque'

call plug#end()

colorscheme deus
"highlight Normal guibg=black
"hi EndOfBuffer guifg=bg

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:taskwiki_markup_syntax = "markdown"

set tabstop=2
set shiftwidth=2
" set noexpandtab
set mouse=a
" set ttymouse=xterm2
syntax on

" https://askubuntu.com/questions/60200/how-to-copy-data-between-different-instances-of-vim
set clipboard=unnamedplus
set background=dark

map <leader>o :tabe 
map <leader>c :tabe ~/.vimrc<cr>
map <leader>q :w<cr>:source ~/.vimrc<cr>:PlugInstall<cr>
map <leader>t :NERDTreeToggle<CR>
map <leader>p :CtrlP<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo



" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
