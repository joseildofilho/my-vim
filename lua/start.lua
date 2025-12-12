local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",     -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.lsp.set_log_level('trace')

require('plugins')

require('plugins.dap')
require('plugins.theme')
--
require('overseer').setup()
require('dressing').setup()

require("prettier").setup {}

require 'config.user_commands.format'
require 'config.autocmds.http'

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd('source ~/.config/nvim/vimrc')
