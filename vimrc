" https://github.com/shaief/dotvim
" based on the dotvim files by MeirKriheli and Oz123
" https://github.com/MeirKriheli/dotvim
" https://github.com/oz123/dude/config_files/vim

set nocompatible " Use Vim defaults (much better!)

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

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
set mouse=a
endif

" ==================================================
" swp files
" ==================================================
" Keep swap files out of the working dir
" Adjust if needed in another dir
set directory=~/tmp

" ==================================================
" Fix meta key in terminal
" fix meta-keys which generate <Esc>a .. <Esc>z
" ==================================================
let c='a'
while c <= 'z'
exec "set <A-".c.">=\e".c
exec "imap \e".c." <A-".c.">"
let c = nr2char(1+char2nr(c))
endw



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

set timeoutlen=1000 ttimeoutlen=10

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

if has('unnamedplus')
      set clipboard=unnamedplus
  else
      set clipboard=unnamed
endif


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
" Bundle 'altercation/vim-colors-solarized'
" color scheme - drakula
" Plugin 'alem0lars/vim-colorscheme-darcula'
" colorschemes
Plugin 'flazz/vim-colorschemes'
" Autoclose
" Bundle 'Townk/vim-autoclose'
Plugin 'kien/rainbow_parentheses.vim'
" move lines/blocks like sublime
Bundle 'matze/vim-move'
" Directories and files tree ==> check lower configuration where it was mapped to <F3>
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'

" Python-mode etc.
" Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'

Plugin 'bling/vim-airline'

Plugin 'terryma/vim-expand-region'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'mattn/emmet-vim'

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


" let g:move_key_modifier = 'C'

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



" ==================================================
" Trailing whitespace handling
" ==================================================
" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/


syntax on
filetype plugin on
filetype indent plugin on

" ==================================================
" Basic Mappings
" ==================================================
" Maps for jj to act as Esc in insert and command modes
ino jj <esc>
cno jj <c-c>
" One can map ctrl-c to something else if needed
map <c-c> <Nop>
imap <c-c> <Nop>


" ==================================================
" Window navigation
" ==================================================
" control + vim direction key to navigate windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
" control + arrow key to navigate windows
noremap <C-Down> <C-W>j "
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l
" <C-TAB> and <C-S-TAB> to switch buffers " in the current window
noremap <C-TAB> :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>

" ==================================================
" ==================================================


" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

" ==================================================
" Disable python-mode rope completion (using Jedi)
" Disable folding
" Don't trim whitespace on save
" ==================================================
let g:pymode_rope_completion = 0
let g:pymode_folding = 0
let g:pymode_trim_whitespaces = 0

" ==================================================
" jedi-vim use splits instead of tabs
" ==================================================
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "right"

" ==================================================
" CtrlP
" ==================================================
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.pyo
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'

au BufEnter *.js :vmap ^_ :s/^/\/\// <Enter> :nohlsearch <Enter> 
au BufEnter *.py :vmap ^_ :s/^/#/ <Enter> :nohlsearch <Enter>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
" "nnoremap tn :tabnew<CR>

" ==================================================
" Airline
" ==================================================
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"" zencoding settings
" remap zen-leader-key
" let g:user_emmet_leader_key = '<c-e>'
colorscheme Monokai
