return require('packer').startup(function(use)

use 'wbthomason/packer.nvim'

use 'neovim/nvim-lspconfig'
use 'RishabhRD/nvim-lsputils'

use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'

use 'dart-lang/dart-vim-plugin' -- TS is causing dart classes to crash

use({
"L3MON4D3/LuaSnip", tag = "v1.*", run = "make install_jsregexp"
})
use 'saadparwaiz1/cmp_luasnip'

use 'rafamadriz/friendly-snippets'
use 'ray-x/lsp_signature.nvim'
use 'onsails/lspkind-nvim'

use 'mfussenegger/nvim-dap'
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use 'theHamsta/nvim-dap-virtual-text'

use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

use 'nvim-lualine/lualine.nvim'
use 'tpope/vim-fugitive'

use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use 'nvim-treesitter/playground'

use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }

use 'nvim-lua/popup.nvim'
use 'RishabhRD/popfix'

use "lukas-reineke/indent-blankline.nvim"

use 'ParamagicDev/vim-medic_chalk'

use 'jose-elias-alvarez/nvim-lsp-ts-utils'

use 'vim-test/vim-test'

use 'simrat39/rust-tools.nvim'

use 'yuezk/vim-js'
use 'sbdchd/neoformat'

use 'ray-x/go.nvim'
use 'ray-x/guihua.lua'

use { "NTBBloodbath/rest.nvim", requires = { "nvim-lua/plenary.nvim" } }

use 'pangloss/vim-javascript'

use 'stevearc/overseer.nvim'
use 'stevearc/dressing.nvim'

use "rebelot/kanagawa.nvim"

use({ "mhanberg/elixir.nvim", requires = { "nvim-lua/plenary.nvim" }})

use 'elixir-editors/vim-elixir'

use 'nvim-tree/nvim-tree.lua'
use('jose-elias-alvarez/null-ls.nvim')
use('MunifTanjim/prettier.nvim')

use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}

use {
  "microsoft/vscode-js-debug",
  opt = true,
  run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
}
use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }

use {
  "nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-jest"
  }
}

use 'gnikdroy/projections.nvim'

use 'folke/neodev.nvim'
end)
