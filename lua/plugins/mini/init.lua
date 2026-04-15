return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    require 'mini.sessions'.setup {
      autoread = true,
      autowrite = true,
    }
    -- require 'mini.starter'.setup()
  end
}
