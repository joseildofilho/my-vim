return {
  'mistweaverco/kulala.nvim',
  opts = {
    debug = true,
    winbar = true,
    default_view = 'headers_body',
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('plugins.kulala.requests')
  end
}
