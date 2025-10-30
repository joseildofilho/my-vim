local dev = {
  path = "~/Codigos/Joseildo/nvim-plugins"
}


local plugins = {
  require 'plugins.mason',
  require 'plugins.jdtls',
  'isobit/vim-caddyfile',
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "make tiktoken",
      opts = {
        model = "claude-sonnet-4",
        prompts = {
          PrDescription = {
            prompt =
            [[
#gitdiff:master
#buffer:visible
Write the PR description
            ]],
          }
        }
      },
    },
  },
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        highlight = {
          "Function"
        }
      },
      scope = {
        highlight = {
          "Function"
        },
        enabled = true,
        include = {
          node_type = {
            ['*'] = {}
          }
        }
      }
    },
  },
  {
    "Dan7h3x/neaterm.nvim",
    branch = "stable",
    event = "VeryLazy",
    opts = {
      use_default_keymaps = false,
      terminals = {
        nvimConfigShortcut = {
          name = "Config",
          cmd = "nvim ~/.config/nvim/vimrc",
          type = "float",
          float_width = 0.8,
          float_height = 0.8,
          on_exit = function()
            vim.cmd('source ~/.config/nvim/vimrc')
          end
        }
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
  },
  require 'plugins.snacks',
  require 'plugins.which-key',
  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'stevearc/oil.nvim',
    opts = {}
  },
  require 'plugins.obsidian',
  require 'plugins.lsp.lspconfig',
  require 'plugins.themes',
  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup {
        pull_requests = {
          use_branch_name_as_title = true,
        }
      }
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {},
  },
  { 'nvim-tree/nvim-web-devicons' },
  { 'mvllow/modes.nvim',          version = 'v0.2.0', opts = {} },
  require 'plugins.kulala',
  { 'chentoast/marks.nvim',      opts = {} },
  {
    'zbirenbaum/copilot.lua',
    config = true,
    opts = {
      suggestion = {
        auto_trigger = true
      }
    }
  },
  {
    'willothy/wezterm.nvim',
    config = true,
    dev = false,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
  {
    'yorickpeterse/nvim-window',
    opts = {
      chars = {
        'j', 'k', 'l', ';', 'u', 'i', 'o', 'p'
      }
    }
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { 'dart-lang/dart-vim-plugin', lazy = true },
  require 'plugins.snippets',
  require 'plugins.cmp',
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      'leoluz/nvim-dap-go',
    },
    opts = {
      layouts = { {
        elements = { {
          id = "scopes",
          size = 0.33
        }, {
          id = "stacks",
          size = 0.33
        } },
        position = "left",
        size = 40
      }, {
        elements = { {
          id = "repl",
          size = 1
        } },
        position = "bottom",
        size = 10
      } }
    }
  },
  'theHamsta/nvim-dap-virtual-text',
  {
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
  },
  require 'plugins.line',
  'tpope/vim-fugitive',
  {
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
          'go',
          'gomod',
          'http',
          'json',
          'markdown',
          'markdown_inline',
          'yaml',
          'toml',
          'caddyfile',
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
  },
  { 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  'nvim-lua/popup.nvim',
  'RishabhRD/popfix',
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    ft = { 'rust' },
  },
  { 'yuezk/vim-js',                  ft = { 'typescript', 'js' } },
  { 'pangloss/vim-javascript',       ft = { 'typescript', 'js' } },
  { 'MunifTanjim/prettier.nvim',     ft = { 'typescript', 'js' } },
  'stevearc/overseer.nvim',
  'stevearc/dressing.nvim',
  {
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
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require 'hop'.setup { keys = 'jkletovxqpdygfbzhcisuran' }
    end
  },
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
  require 'plugins.tests.neotest',
  --{ 'gnikdroy/projections.nvim', branch = 'pre_release' },
  --{
  --  event = "BufReadPre",
  --  'olimorris/persisted.nvim',
  --  lazy = false,
  --  opts = {
  --    autoload = true,
  --    use_git_branch = true,
  --  },
  --  config = function()
  --    require('telescope').load_extension('persisted')
  --  end,
  --},
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require 'harpoon'.setup {
        settings = {
          save_on_toggle = true,
          save_on_ui_close = true
        }
      }
    end
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  require 'plugins.go',
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  require 'plugins.platform_io',
}

local lazy = require 'lazy'
lazy.setup {
  spec = plugins,
  dev = dev
}
