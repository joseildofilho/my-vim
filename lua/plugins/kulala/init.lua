return {
  'mistweaverco/kulala.nvim',
  version = 'v5.3.0',
  opts = {
    debug = true,
    winbar = true,
    ui = {
      default_view = 'headers_body',
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function(_, opts)
    require('kulala').setup(opts)
    require('plugins.kulala.requests')
  end
}
