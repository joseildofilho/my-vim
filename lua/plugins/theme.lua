require('kanagawa').setup{
    background = {
        dark = "wave",
        light = "lotus"
    },
    transparent=false
}
vim.o.background = 'light'
vim.cmd('colorscheme kanagawa-lotus')
