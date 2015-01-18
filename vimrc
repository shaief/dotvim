" https://github.com/shaief/dotvim
" based on the dotvim files by MeirKriheli and Oz123
" https://github.com/MeirKriheli/dotvim
" https://github.com/oz123/dude/config_files/vim



" ==================================================
" Basic Settings
" ==================================================
let mapleader="," " change the leader to be a comma vs slash
" set textwidth=80 " Try this out to see how textwidth helps
set ch=2 " Make command line two lines high
set ls=2 " allways show status line
set scrolloff=3 " keep 3 lines when scrolling
set cursorline " have a line indicate the cursor location
set cindent " cindent
set autoindent " always set autoindenting on
set showcmd " display incomplete commands
set ruler " show the cursor position all the time
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set visualbell
set nobackup " do not keep a backup file
set number " show line numbers
set title " show title in console title bar

set statusline=%<%f\ " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y] " filetype
set statusline+=\ [%{getcwd()}] " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info      "


" ==================================================
" vimrc handling
" ==================================================
" ,v loads .vimrc
" ,V reloads .vimrc -- activating changes (needs save)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


highlight PythonBlock ctermbg=red ctermfg=white guibg=#592929
match PythonBlock /\%81v.\+/
highlight OverLength ctermbg=grey ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" Columns and lines, only from vim >= 7.3
"if version >= 703
"    set match=80
"    set match=120
"endif
"
"if has("gui_running")
"    set lines=75
"    set columns=180
"endif


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
set showcmd
set expandtab
set autoindent
set rnu
set modifiable

" incremental search
set incsearch
" highlighted search results
set hlsearch

" ======================================================================
" =                         Bundle Vundle                              =
" ======================================================================
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
" Directories and files tree ==> check lower configuration where it was mapped to <F3>
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

call vundle#end() " required
filetype plugin indent on " required
" ======================================================================


syntax on

" ==================================================
" =               Tagbar Mapping                   =
" ==================================================
nmap <F5> :TagbarToggle<CR>
" ==================================================
" =                  NERDTree                      =
" ==================================================
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

" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>



