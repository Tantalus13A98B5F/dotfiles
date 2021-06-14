set nocompatible
let mapleader=";"

" View
syntax on
set background=dark
set encoding=utf-8
set scrolloff=0
set cursorline
set showcmd
set wildmenu
set t_vb=

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
"nnoremap j gj
"nnoremap k gk

" Tags
set tags=./.tags;
set nocscopetag
nnoremap <leader>] :tnext<CR>
nnoremap <leader>[ :tprev<CR>
nnoremap <C-w><C-]> <C-w>]<C-w>T

" Edit
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
noremap <leader>m mmHmt:%s/<C-v><CR>//ge<CR>'tzt'm
map <silent> <leader>pp :setlocal paste!<CR>
inoremap jk <ESC>
vnoremap ( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap { ><ESC>`<O{<ESC>`>o}<ESC>`<
set noswapfile

" Vim-Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
let plug_vim = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs '.plug_vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" LightLine
set noshowmode laststatus=2
let g:lightline = {
  \   'colorscheme': 'solarized',
  \ }

" Plugin Keymap
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>ft :Filetypes<CR>
nnoremap <leader>b :Buffers<CR>
