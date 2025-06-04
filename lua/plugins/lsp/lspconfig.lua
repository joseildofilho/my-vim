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
    lspconfig.gopls.setup {}

    require('plugins.lsp-utils')
    require("plugins.lsp")
  end,
  lazy = true,
  ft = { 'lua', 'dart' }
}
vim.lsp.enable({ 'ts_ls', 'lua_ls', 'elmls', 'gopls', 'arduino_language_server', })

return {
  lspconfig_lazy_config,
  'RishabhRD/nvim-lsputils',
  'ray-x/lsp_signature.nvim',
  'onsails/lspkind-nvim',
}
