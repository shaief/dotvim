" https://github.com/shaief/dotvim
" based on the dotvim files by MeirKriheli and Oz123
" https://github.com/MeirKriheli/dotvim
" https://github.com/oz123/dude/config_files/vim

set nocompatible " Use Vim defaults (much better!)

if filereadable(glob("~/.vimrc.local")) 
        source ~/.vimrc.local
endif

if filereadable(glob("~/.vim/vimrc.basic")) 
        source ~/.vim/vimrc.basic
endif

if filereadable(glob("~/.vim/vimrc.plugins")) 
        source ~/.vim/vimrc.plugins
endif

if filereadable(glob("~/.vim/vimrc.plugins_settings")) 
        source ~/.vim/vimrc.plugins_settings
endif

if filereadable(glob("~/.vim/vimrc.colorschemes")) 
        source ~/.vim/vimrc.colorschemes
endif

