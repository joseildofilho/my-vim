local lua_ls_config = {
    settings = {
        diagnostics = {
            globals = { 'vim' }
        },
        Lua = {
            completion = {
                callSnippet = "Replace",
            }
        }
    }
}

local lspconfig_lazy_config = {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require 'lspconfig'
        lspconfig.clangd.setup {}
        lspconfig.dartls.setup {}
        lspconfig.tsserver.setup {}
        lspconfig.lua_ls.setup(lua_ls_config)
        require('plugins.lsp-utils')
        require("plugins.lsp")
    end,
    lazy = true,
    ft = { 'lua', 'dart', 'typescript' },
    dependencies = {}
}

return {
    lspconfig_lazy_config,
    'RishabhRD/nvim-lsputils',
    'ray-x/lsp_signature.nvim',
    'onsails/lspkind-nvim',
    { 'jose-elias-alvarez/nvim-lsp-ts-utils', ft = { 'typescript', 'js' } },
}
