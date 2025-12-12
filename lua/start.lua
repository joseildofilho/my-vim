local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
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

require'config.user_commands.format'

vim.wo.number = true
vim.wo.relativenumber = true

local fidget = require'fidget'
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.http"},
    callback = function(ev)
        local current_buf = ev.buf
        vim.treesitter.stop(current_buf)
        local lang = vim.treesitter.language.get_lang('http')
        local ok, err = pcall(vim.treesitter.start, current_buf, lang)
        if not ok then
            fidget.notify("We Have some error on trying to load the highlighter by the treesitter", vim.log.levels.ERROR)
            print(err)
        end
        fidget.notify("Treesitter for HTTP is loaded", vim.log.levels.INFO)
    end
})

vim.cmd('source ~/.config/nvim/vimrc')
