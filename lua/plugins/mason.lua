return {
  {
    'mason-org/mason.nvim',
    opts = {}
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = { 'lua-language-server', 'gopls', 'typescript-language-server', 'codebook' },
    }
  }
}
