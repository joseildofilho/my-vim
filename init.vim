"set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"stdpath('config') . '/init.vim'
source ~/.config/nvim/vimrc

lua require('start')
