local lspconfig_lazy_config = {
  'neovim/nvim-lspconfig',
  config = function()
    require('plugins.lsp-utils')
    require("plugins.lsp")
  end
}

vim.lsp.enable({ 'lua_ls', 'arduino_language_server', 'kulala_ls', 'jsonls', 'terraformls', 'ts_ls', 'json_ls' })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'json',
  callback = function(_)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.config('jsonls', {
      capabilities = capabilities,
    })
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = 'sql',
  callback = function(_)
    vim.lsp.enable { 'postgres_lsp', 'sqruff' }
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = 'cpp,h,hpp,c',
  callback = function(_)
    require 'lspconfig'.ccls.setup {}
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = '*.java',
  callback = function(_)
    require 'plugins.jdtls.jdtls_setup'.setup {}
  end
})

return {
  lspconfig_lazy_config,
  'RishabhRD/nvim-lsputils',
  'ray-x/lsp_signature.nvim',
  'onsails/lspkind-nvim',
}
