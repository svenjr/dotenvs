syntax on
set nu ru et
set ts=2 sts=2 sw=2
set cursorline
set hlsearch
set clipboard=unnamedplus

set nocompatible   " be improved, required
filetype off       " required
" store the plugins in plugged dir
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'catppuccin/nvim', { 'branch': 'vim', 'as': 'catppuccin' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'greggh/claude-code.nvim'
call plug#end()
" select the color scheme
colorscheme catppuccin
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
map <silent> <C-n> :NERDTreeFocus<CR>
lua require('claude-code').setup()

