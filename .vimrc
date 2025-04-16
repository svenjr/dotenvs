" Set compatibility to Vim only.
set nocompatible

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin setup
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

" Enable filetypes, syntax, and theme
filetype plugin indent on
syntax enable

"set termguicolors
let ayucolor = "mirage"   " or 'dark', 'light'
colorscheme tokyonight

" UI and general settings
set number
set scrolloff=5
set ttyfast
set wrap
set backspace=indent,eol,start
set hlsearch
set modelines=0
set spell spelllang=en_us
