set nocompatible

" View
syntax on
set background=dark
set cursorline
set showmode
set showcmd
set wildmenu

" Indent
filetype plugin indent on
set et sw=4 ts=4 sts=4
autocmd FileType make setlocal noet
set autoindent
set modeline

" Search
set incsearch
set hlsearch

" Navigation
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \ execute "normal! g'\"" | endif
set mouse=a
nnoremap j gj
nnoremap k gk

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
let mapleader=";"
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

