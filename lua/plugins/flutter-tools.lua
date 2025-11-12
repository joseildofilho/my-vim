return {
  'akinsho/flutter-tools.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  lazy = true,
  ft = { 'dart' },
  opts = {
    debugger = {
      enabled = false,
      run_via_dap = false
    },
    fvm = true,
    lsp = {
      color = {
        enabled = false
      }
    }
  }
}
