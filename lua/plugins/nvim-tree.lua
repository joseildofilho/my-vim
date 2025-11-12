return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require 'nvim-tree'.setup {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      view = {
        relativenumber = true,
        adaptive_size = true
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            item = "│ ",
            none = "  ",
          }
        },
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = true
          }
        },
      }
    }
  end,
}
