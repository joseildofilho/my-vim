local lspconfig_lazy_config = {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'

    lspconfig.clangd.setup {}
    lspconfig.beancount.setup {}
    lspconfig.jsonls.setup {}
    lspconfig.zls.setup {}
    lspconfig.terraformls.setup {}
    lspconfig.jdtls.setup {}
    lspconfig.ts_ls.setup {}

    require('plugins.lsp-utils')
    require("plugins.lsp")
  end,
  lazy = true,
  ft = { 'lua', 'dart' }
}
vim.lsp.enable({ 'lua_ls', 'elmls', 'gopls', 'arduino_language_server', 'kulala_ls', 'postgres_lsp', 'sqruff' })

return {
  lspconfig_lazy_config,
  'RishabhRD/nvim-lsputils',
  'ray-x/lsp_signature.nvim',
  'onsails/lspkind-nvim',
}
