set nocompatible
let mapleader=";"

" View
syntax on
set background=dark
set encoding=utf-8
set scrolloff=2
set cursorline
set showmode
set showcmd
set wildmenu

" Indent
filetype plugin indent on
set expandtab smarttab sw=4 ts=4
autocmd FileType make setlocal noet
set autoindent smartindent
set modeline

" Search
set incsearch hlsearch
set ignorecase smartcase
vnoremap * y/<C-r>"<CR>
map <leader><CR> :noh<CR>

" Navigation
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \ execute "normal! g'\"" | endif
set mouse=a
nnoremap j gj
nnoremap k gk

" Edit
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
noremap <leader>m mmHmt:%s/<C-v><CR>//ge<CR>'tzt'm
map <leader>pp :setlocal paste!<CR>:set paste?<CR>
inoremap jk <ESC>
set noswapfile

" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
call plug#end()

" Plugin Keymap
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

