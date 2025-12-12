local dev = {
  path = "~/Codigos/Joseildo/nvim-plugins"
}

local plugins = {
  'isobit/vim-caddyfile',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-fugitive',
  'stevearc/overseer.nvim',
  'RishabhRD/popfix',

  require 'plugins.mason',
  require 'plugins.jdtls.jdtls',
  require 'plugins.copilot-chat',
  require 'plugins.dbee',
  require 'plugins.indent-blankline',
  require 'plugins.snacks',
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

  { 'yuezk/vim-js',              ft = { 'typescript', 'js' } },
  { 'pangloss/vim-javascript',   ft = { 'typescript', 'js' } },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    ft = { 'typescript', 'js' }
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    ft = { 'typescript', 'js' }
  },
  {
    "lowitea/aw-watcher.nvim",
    opts = { -- required, but can be empty table: {}
      -- add any options here
      -- for example:
      aw_server = {
        host = "127.0.0.1",
        port = 5600,
      },
    },
  }
}

local lazy = require 'lazy'
lazy.setup {
  spec = plugins,
  dev = dev
}
