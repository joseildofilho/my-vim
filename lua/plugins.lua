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
    dev = false,
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
    version = '^6', -- Recommended
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
  {
    'anurag3301/nvim-platformio.lua',
    -- cmd = { 'Pioinit', 'Piorun', 'Piocmdh', 'Piocmdf', 'Piolib', 'Piomon', 'Piodebug', 'Piodb' },

    -- optional: cond used to enable/disable platformio
    -- based on existance of platformio.ini file and .pio folder in cwd.
    -- You can enable platformio plugin, using :Pioinit command
    cond = function()
      -- local platformioRootDir = vim.fs.root(vim.fn.getcwd(), { 'platformio.ini' }) -- cwd and parents
      local platformioRootDir = (vim.fn.filereadable('platformio.ini') == 1) and vim.fn.getcwd() or nil
      if platformioRootDir and vim.fs.find('.pio', { path = platformioRootDir, type = 'directory' })[1] then
        -- if platformio.ini file and .pio folder exist in cwd, enable plugin to install plugin (if not istalled) and load it.
        vim.g.platformioRootDir = platformioRootDir
      elseif (vim.uv or vim.loop).fs_stat(vim.fn.stdpath('data') .. '/lazy/nvim-platformio.lua') == nil then
        -- if nvim-platformio not installed, enable plugin to install it first time
        vim.g.platformioRootDir = vim.fn.getcwd()
      else                                                     -- if nvim-platformio.lua installed but disabled, create Pioinit command
        vim.api.nvim_create_user_command('Pioinit', function() --available only if no platformio.ini and .pio in cwd
          vim.api.nvim_create_autocmd('User', {
            pattern = { 'LazyRestore', 'LazyLoad' },
            once = true,
            callback = function(args)
              if args.match == 'LazyRestore' then
                require('lazy').load({ plugins = { 'nvim-platformio.lua' } })
              elseif args.match == 'LazyLoad' then
                vim.notify('PlatformIO loaded', vim.log.levels.INFO, { title = 'PlatformIO' })
                vim.cmd('Pioinit')
              end
            end,
          })
          vim.g.platformioRootDir = vim.fn.getcwd()
          require('lazy').restore({ plguins = { 'nvim-platformio.lua' }, show = false })
        end, {})
      end
      return vim.g.platformioRootDir ~= nil
    end,

    -- Dependencies are lazy-loaded by default unless specified otherwise.
    dependencies = {
      { 'akinsho/toggleterm.nvim' },
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'folke/which-key.nvim' },
    },
  }
}

local lazy = require 'lazy'
lazy.setup {
  spec = plugins,
  dev = dev
}
