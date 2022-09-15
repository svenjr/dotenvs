" Set compatibility to Vim only.
"
set nocompatible

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

set termguicolors

" Set colorscheme
" colorscheme last256
 colo sialoquent
" colo diokai
" colo luna-term
" colo jellybeans
" colo blackboard
" colo Atelier_SavannaLight
" colo ayu
