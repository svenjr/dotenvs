" Set compatibility to Vim only.
"
set nocompatible

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'ayu-theme/ayu-vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" Make sure backspaces work
set backspace=indent,eol,start

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Spell Check to the best english
set spell spelllang=en_us

" Automatically wrap text that extends beyond the screen length.
set wrap

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Speed up scrolling in Vim
set ttyfast

" Show line numbers
set number

" Highlight matching search patterns
set hlsearch

set termguicolors     " enable true colors support
let ayucolor="dark" " for mirage version of theme
colorscheme ayu

" Set colorscheme
" colorscheme last256
" colo sialoquent
" colo diokai
" colo luna-term
" colo jellybeans
" colo blackboard
" colo Atelier_SavannaLight
" colo ayu
" colo tokyonight
