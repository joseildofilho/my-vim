require'globals'
-- it is a recomendation from nvimtree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.cmd('let &packpath = &runtimepath')
require('start')
