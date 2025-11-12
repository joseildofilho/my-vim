local lspconfig_lazy_config = {
  'neovim/nvim-lspconfig',
  config = function()
    require('plugins.lsp.lsp-utils')
    require("plugins.lsp.lsp")
  end
}

vim.lsp.enable({ 'lua_ls', 'kulala_ls', 'terraformls', 'ts_ls' })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = 'sql',
  callback = function(_)
    vim.lsp.enable { 'postgres_lsp', 'sqruff' }
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = 'cpp,h,hpp,c',
  callback = function(_)
    vim.lsp.config('ccls', {})
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
