require('lazy').setup({
    --{ 'axieax/typo.nvim', opts={} },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'mvllow/modes.nvim',
        version = 'v0.2.0',
        opts = {}
    },
    {
        'mistweaverco/kulala.nvim',
        opts = {
            debug = true,
        }
    },
    -- {
    --     'rest-nvim/rest.nvim',
    --     dependencies = {
    --         "nvim-neotest/nvim-nio",
    --         "j-hui/fidget.nvim",
    --     }
    -- },
    { 'chentoast/marks.nvim',       opts = {} },
    {
        'zbirenbaum/copilot.lua',
        config = true,
        opts = {
            suggestion = {
                auto_trigger = true
            }
        }
    },
    -- {
    --     'willothy/wezterm.nvim',
    --     config = true
    -- },
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
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    require 'plugins.lsp.lspconfig',

    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    { 'dart-lang/dart-vim-plugin',       lazy = true }, -- TS is causing dart classes to crash

    {
        "L3MON4D3/LuaSnip",
        version = "v1.*",
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/LuaSnip/" } })
        end
    },
    'saadparwaiz1/cmp_luasnip',
    --
    'rafamadriz/friendly-snippets',
    --
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
                enabled = true,
                run_via_dap = false
            },
            fvm = false,
            lsp = {
                color = {
                    enabled = false
                }
            }
        }
    },
    'nvim-lualine/lualine.nvim',
    'tpope/vim-fugitive',
    { 'nvim-treesitter/nvim-treesitter', lazy = false,                          build = 'TSUpdate' },
    { 'nvim-treesitter/playground',      cmd = 'TSPlaygroundToggle' },
    { 'nvim-telescope/telescope.nvim',   dependencies = 'nvim-lua/plenary.nvim' },
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
    { 'yuezk/vim-js',              ft = { 'typescript', 'js' } },
    { 'pangloss/vim-javascript',   ft = { 'typescript', 'js' } },
    { 'MunifTanjim/prettier.nvim', ft = { 'typescript', 'js' } },

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
    { 'gnikdroy/projections.nvim', branch = 'pre_release' },
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
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            require("go").setup {
                lsp_inlay_hints = {
                    enabled = true
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
    --{
    --    "vhyrro/luarocks.nvim",
    --    priority = 1000,
    --    opts = {
    --        rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    --    },
    --    config = true,
    --}
})
