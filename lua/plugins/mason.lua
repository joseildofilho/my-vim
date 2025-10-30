return {
  {
    'mason-org/mason.nvim',
    opts = {}
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      automatic_enable = {
        exclude = {
          -- needs external plugin
          'jdtls',
        }
      }
    }
  }
}
