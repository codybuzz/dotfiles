" GENERAL SETTINGS  ---------------------------------------
set autoindent
set cursorline
set expandtab
set hlsearch
set incsearch
set laststatus=2
set modelines=0
set mouse=a
set nobackup
set nocompatible
set noswapfile
set nowrap
set number
set relativenumber
set shiftwidth=4
set showmatch
set showmatch
set showmode
set showtabline=2
set splitbelow
set splitright
set tabstop=4
syntax on


" KEYBINDS ------------------------------------------------
let mapleader=','
nnoremap <leader>e :e<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>r :set relativenumber!<CR>
nnoremap <C-Up> :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-h> gT
nnoremap <S-l> gt
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoreabbrev tn tabnew
