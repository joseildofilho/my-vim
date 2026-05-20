local dev = {
  path = "~/Codigos/Joseildo/nvim-plugins"
}

require 'plugins.marks'

local plugins = {
  'isobit/vim-caddyfile',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-fugitive',
  'stevearc/overseer.nvim',
  'RishabhRD/popfix',
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require 'lint'.linters_by_ft = {
        java = { 'checkstyle' },
        lua = { 'luacheck' }
      }
    end
  },

  require 'plugins.mason',
  require 'plugins.jdtls.jdtls',
  require 'plugins.copilot-chat',
  require 'plugins.dbee',
  require 'plugins.indent-blankline',
  require 'plugins.snacks',
  require 'plugins.mini.init',
  require 'plugins.which-key',
  require 'plugins.trouble',
  require 'plugins.todo-comments',
  require 'plugins.oil',
  require 'plugins.obsidian',
  require 'plugins.lsp.lspconfig',
  require 'plugins.themes',
  require 'plugins.octo',
  require 'plugins.render-markdown',
  require 'plugins.modes',
  require 'plugins.kulala',
  require 'plugins.copilot',
  require 'plugins.wezterm',
  require 'plugins.winsep',
  require 'plugins.nvim-window',
  require 'plugins.dart',
  require 'plugins.snippets',
  require 'plugins.cmp',
  require 'plugins.dap-ui',
  require 'plugins.dap-virtual-text',
  require 'plugins.flutter-tools',
  require 'plugins.line',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.rustaceanvim',
  require 'plugins.nvim-tree',
  require 'plugins.hop',
  require 'plugins.tests.neotest',
  require 'plugins.harpoon',
  require 'plugins.fidget',
  require 'plugins.go',
  require 'plugins.lazydev',
  require 'plugins.platform_io',
  require 'plugins.conform',
  require 'plugins.lua-console',
  require 'plugins.atone',
  require 'plugins.triforce',
  require 'plugins.exercism',
  'joerdav/templ.vim',
}

local lazy = require 'lazy'
lazy.setup {
  spec = plugins,
  dev = dev
}
