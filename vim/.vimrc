" GENERAL SETTINGS  ---------------------------------------
set autoindent
set colorcolumn=101
set cursorline
set expandtab
set hlsearch
set incsearch
set laststatus=2
set modelines=0
set mouse=a
set nobackup
set nocompatible
set nosmartindent
set noswapfile
set nowrap
set number
set relativenumber
set ruler
set scrolloff=5
set shiftwidth=4
set showmatch
set showmode
set showtabline=2
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
syntax on

cnoreabbrev tn tabnew


" KEYBINDS ------------------------------------------------
let mapleader=','

" normal mode
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
nnoremap <Enter> o<ESC>
nnoremap <S-Enter> O<ESC>
nnoremap <leader>cc :set ignorecase!<CR>

" map some bindings in insert mode for moving around easier
inoremap <C-u> <ESC>ui
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" TODO find better mappings for these, ctrl causes these two binds to be identical
inoremap <S-Enter> <ESC>O
inoremap <C-Enter> <C-o>o
" inoremap <C-o> <ESC>o
" inoremap <C-S-o> <ESC>O
