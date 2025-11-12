return {
  'nvim-telescope/telescope.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { "node_modules/.*", "dist/.*", "build/.*", "deps/.*" },
        path_display = { "smart" }
      },
    }
  end
}
