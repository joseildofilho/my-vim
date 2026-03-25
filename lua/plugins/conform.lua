return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { lsp_format = "fallback" },
      java = { 'google-java-format' },
      go = { 'golines' },
      dart = { 'fvm dart format write', lsp_format = "fallback" }
    }
  }
}
