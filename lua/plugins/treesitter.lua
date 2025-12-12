return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = 'TSUpdate',
  config = function()
    require 'nvim-treesitter'.setup {
      ensure_installed = {
        'lua',
        'rust',
        'typescript',
        'javascript',
        'java',
        'go',
        'gomod',
        'http',
        'json',
        'markdown',
        'markdown_inline',
        'yaml',
        'toml',
        'caddyfile',
        'cpp',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      playground = {
        enable = true,
      },
    }
  end,
}
