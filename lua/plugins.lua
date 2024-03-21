require('lazy').setup({
{ 
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    opts = {
        workspaces = {
            {
                name = 'obsidian-vault',
                path = '~/Documentos/obsidian-vault'
            }
        }
    }
},
-- nvim v0.8.0
{
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
},
'neovim/nvim-lspconfig',
'RishabhRD/nvim-lsputils',

'hrsh7th/nvim-cmp',
'hrsh7th/cmp-nvim-lsp',
'hrsh7th/cmp-buffer',
'hrsh7th/cmp-path',
'hrsh7th/cmp-cmdline',

{'dart-lang/dart-vim-plugin', lazy=true}, -- TS is causing dart classes to crash

{
"L3MON4D3/LuaSnip", version = "v1.*", build = "make install_jsregexp"
},
{ 'folke/neodev.nvim', ft={'lua'}, opts = {
    library = {
        plugins = {
            "nvim-dap-ui"
        },
        types = true
    },
    }
},
'saadparwaiz1/cmp_luasnip',
--
'rafamadriz/friendly-snippets',
'ray-x/lsp_signature.nvim',
'onsails/lspkind-nvim',
--
{ "rcarriga/nvim-dap-ui", 
  dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} ,
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
        fvm=true,
        lsp = {
            color = {
                enabled = false
            }
        }
    }
},
'nvim-lualine/lualine.nvim',
'tpope/vim-fugitive',
{ 'nvim-treesitter/nvim-treesitter', lazy = false, build = 'TSUpdate' },
{ 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
{ 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
'nvim-lua/popup.nvim',
'RishabhRD/popfix',
--
--use "lukas-reineke/indent-blankline.nvim"
--
--
'vim-test/vim-test',
--
{
  'mrcjkb/rustaceanvim',
  version = '^3', -- Recommended
  ft = { 'rust' },
},
--
{ 'yuezk/vim-js', ft = {'typescript', 'js'} },
{ 'pangloss/vim-javascript', ft = {'typescript', 'js'} },
{ 'MunifTanjim/prettier.nvim', ft = {'typescript', 'js'} },
{ 'jose-elias-alvarez/nvim-lsp-ts-utils', ft = {'typescript', 'js'} },

'stevearc/overseer.nvim',
'stevearc/dressing.nvim',

'rebelot/kanagawa.nvim',
'nvim-tree/nvim-tree.lua',
'jose-elias-alvarez/null-ls.nvim',
--
{
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'jkletovxqpdygfbzhcisuran' }
  end
},
--
{
  "microsoft/vscode-js-debug",
  lazy = true,
  build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  ft = {'typescript', 'js'}
},
{ 
  "mxsdev/nvim-dap-vscode-js",
  dependencies = {"mfussenegger/nvim-dap"},
  ft = {'typescript', 'js'}
},
--
{
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-jest",
  }
},
{'gnikdroy/projections.nvim', branch='pre_release'},
{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require'harpoon'.setup{
            settings = {
                save_on_toggle = true,
                save_on_ui_close = true
            }
        }
    end
},
'github/copilot.vim'
})
