" https://github.com/shaief/dotvim
" based on the dotvim files by MeirKriheli and Oz123
" https://github.com/MeirKriheli/dotvim
" https://github.com/oz123/dude/config_files/vim

set nocompatible " Use Vim defaults (much better!)

set bs=indent,eol,start " allow backspacing over everything in insert mode
set ai " always set autoindenting on
"set backup " keep a backup file
set viminfo='20,\"50 " read/write a .viminfo file, don't store more
" than 50 lines of registers
set history=50	" keep 50 lines of command line history
set ruler " show the cursor position all the time

" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4

set shortmess=filnxtToOI
set noea
set scs
set nu
set expandtab
set autoindent
set rnu
set modifiable

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" My Bundles here:
" git wrapper
Bundle 'tpope/vim-fugitive'
" A Vim plugin which shows a git diff in the gutter (sign column) 
Bundle 'airblade/vim-gitgutter'
" easymotion - as the name suggest :)
Bundle 'Lokaltog/vim-easymotion' 
" color scheme - solarized
Bundle 'altercation/vim-colors-solarized'
" Autoclose
Bundle 'Townk/vim-autoclose'
Plugin 'kien/rainbow_parentheses.vim'
" move lines/blocks like sublime
Bundle 'matze/vim-move'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

call vundle#end() " required
filetype plugin indent on " required
syntax on



" ==================================================
" " Tagbar Mapping
" " ==================================================
nmap <F5> :TagbarToggle<CR>
" " ==================================================
" " NERDTree
" " ==================================================
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
map <F3> :NERDTreeToggle<CR>

" highlight cursor line
set cursorline
 
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '+-'


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" hight background when lines are longer
" let &colorcolumn=join(range(81,999),",")"





