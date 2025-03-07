local lua_ls_config = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    single_file_support = true,
    settings = {
        diagnostics = {
            globals = { 'vim' }
        },
        Lua = {
            completion = {
                callSnippet = "Replace",
            }
        }
    },
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = true,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
}

local lspconfig_lazy_config = {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require 'lspconfig'
        lspconfig.clangd.setup {}
--        lspconfig.dartls.setup {
--            cmd = {"dart", "language-server", "--protocol=lsp"}
--        }
        lspconfig.ts_ls.setup {}
        lspconfig.lua_ls.setup(lua_ls_config)
        require('plugins.lsp-utils')
        require("plugins.lsp")
    end,
    lazy = true,
    ft = { 'lua', 'dart', 'typescript' },
    dependencies = {
        {
            'folke/neodev.nvim',
            ft = { 'lua' },
            lazy = true
        }
    }
}

return {
    lspconfig_lazy_config,
    'RishabhRD/nvim-lsputils',
    'ray-x/lsp_signature.nvim',
    'onsails/lspkind-nvim',
    { 'jose-elias-alvarez/nvim-lsp-ts-utils', ft = { 'typescript', 'js' } },
}
