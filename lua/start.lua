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
vim.lsp.set_log_level('error')

require('plugins')

require('plugins.dap')
--require('plugins.projections')
require('plugins.theme')
--
require('overseer').setup()
require('dressing').setup()

require("prettier").setup {}
vim.wo.number = true
vim.wo.relativenumber = true
require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,           -- false will disable the whole extension
        disable = { "c" },       -- list of language that will be disabled
    },
}

require('telescope').load_extension('persisted')

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
    end
})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}

vim.cmd('source ~/.config/nvim/vimrc')
