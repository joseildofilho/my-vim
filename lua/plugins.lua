require('lazy').setup({
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
'saadparwaiz1/cmp_luasnip',
--
'rafamadriz/friendly-snippets',
'ray-x/lsp_signature.nvim',
'onsails/lspkind-nvim',
--
--use 'mfussenegger/nvim-dap'
--use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
--use 'theHamsta/nvim-dap-virtual-text'
--use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
'nvim-lualine/lualine.nvim',
'tpope/vim-fugitive',
{ 'nvim-treesitter/nvim-treesitter', lazy = false, build = 'TSUpdate' },
{'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
{ 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
'nvim-lua/popup.nvim',
'RishabhRD/popfix',
--
--use "lukas-reineke/indent-blankline.nvim"
--
--
--use 'vim-test/vim-test'
--
--use 'simrat39/rust-tools.nvim'
--
{'yuezk/vim-js', ft = {'ts', 'js'}},
{'pangloss/vim-javascript', ft = {'ts', 'js'}},
{'MunifTanjim/prettier.nvim', ft = {'ts', 'js'}},
{ 'jose-elias-alvarez/nvim-lsp-ts-utils', ft = {'ts', 'js'}},

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
--use {
--  "microsoft/vscode-js-debug",
--  opt = true,
--  run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
--}
--use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
--
--use {
--  "nvim-neotest/neotest",
--  requires = {
--    "nvim-lua/plenary.nvim",
--    "nvim-treesitter/nvim-treesitter",
--    "antoinemadec/FixCursorHold.nvim",
--    "rouge8/neotest-rust",
--    "nvim-neotest/neotest-jest",
--    "nvim-neotest/neotest-go",
--  }
--}
--
'gnikdroy/projections.nvim',

{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"}
},
})
