call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'
call plug#end()


" test.vim
set termguicolors
syntax enable

" Set ayu variant (optional, but usually looks best with mirage)
let ayucolor="mirage"

" Load ayu theme (make sure it's installed via your plugin manager)
colorscheme ayu

