local dev = {
  path = "~/Codigos/Joseildo/nvim-plugins"
}


local plugins = {
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
            #buffers:visible
            Write the PR description
            ]],
          }
        }
      },
    },
  },
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "make tiktoken",
      opts = {
        -- See Configuration section for options
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
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  { 'mrjones2014/smart-splits.nvim' },
  {
    'stevearc/oil.nvim',
    opts = {}
  },
  {
    'nvzone/typr',
    dependencies = {
      'nvzone/volt'
    }
  },
  require 'plugins.obsidian',
  require 'plugins.lsp.lspconfig',
  require 'plugins.themes',
  {
    'pwntester/octo.nvim',
    dev = true,
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      -- OR 'ibhagwan/fzf-lua',
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
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  { 'nvim-tree/nvim-web-devicons' },
  { 'mvllow/modes.nvim',            version = 'v0.2.0', opts = {} },
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
    dev = true,
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
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  { 'dart-lang/dart-vim-plugin', lazy = true }, -- TS is causing dart classes to crash
  require 'plugins.snippets',
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
    lazy = false,
    build = 'TSUpdate',
  },
  { 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  'nvim-lua/popup.nvim',
  'RishabhRD/popfix',
  --
  --use "lukas-reineke/indent-blankline.nvim"
  --
  {
    'mrcjkb/rustaceanvim',
    version = '^3', -- Recommended
    ft = { 'rust' },
  },
  --
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
  -- 'jose-elias-alvarez/null-ls.nvim',
  --
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
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
    opts = {
      -- options
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    version = "v0.10.0",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("go").setup {
        -- gofmt = "golines",
        -- max_line_len = 100,
        tag_transform = true,
        lsp_inlay_hints = {
          enabled = false,
        },
        lsp_keymaps = false,
        lsp_cfg = {
          capabilities = capabilities,
          -- other setups
        },
      }
    end,
    ft = { "go", 'gomod' },
    lazy = true,
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}

local lazy = require 'lazy'
lazy.setup {
  spec = plugins,
  dev = dev
}
