set nocompatible
filetype plugin indent on
syntax on

set number
set relativenumber
set mouse=a
set termguicolors
set hidden
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set incsearch
set hlsearch
set scrolloff=8
set sidescrolloff=8
set splitbelow
set splitright
set updatetime=300
set signcolumn=yes
set completeopt=menuone,noselect
set clipboard=unnamedplus

let mapleader=" "

call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'

call plug#end()

set background=dark
" colorscheme gruvbox

let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'



nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :Helptags<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>h :nohlsearch<CR>

nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" =========================
" NERDTree 
" =========================

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 0

function! NERDTreeSmartToggle()
  if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
    if bufname('%') == t:NERDTreeBufName
      NERDTreeToggle
    else
      NERDTreeFocus
    endif
  else
    NERDTreeToggle
  endif
endfunction

nnoremap <silent> <leader>e :call NERDTreeSmartToggle()<CR>
nnoremap <silent> <C-n> :call NERDTreeSmartToggle()<CR>
nnoremap <leader>o :NERDTreeFind<CR>
nnoremap <leader>ef :NERDTreeFind<CR>
nnoremap <leader>eh :NERDTree ~<CR>
nnoremap <leader>er :NERDTree /<CR>

" =========================
" Terminal toggle config
" =========================

let g:term_buf = -1

function! ToggleTerm()
  if bufexists(g:term_buf)
    execute 'bd! ' . g:term_buf
    let g:term_buf = -1
  else
    botright split
    resize 12
    terminal
    let g:term_buf = bufnr('%')
    startinsert
  endif
endfunction

nnoremap <leader>t :call ToggleTerm()<CR>
tnoremap <leader>t <C-\><C-n>:call ToggleTerm()<CR>
tnoremap <Esc> <C-\><C-n>
