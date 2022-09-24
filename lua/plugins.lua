
return require('packer').startup(function(use)

use 'wbthomason/packer.nvim'

use 'neovim/nvim-lspconfig'

use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'

use 'dart-lang/dart-vim-plugin' -- TS is causing dart classes to crash

use 'saadparwaiz1/cmp_luasnip'
use 'L3MON4D3/LuaSnip'

use 'rafamadriz/friendly-snippets'
use 'ray-x/lsp_signature.nvim'
use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
use 'onsails/lspkind-nvim'

use 'mfussenegger/nvim-dap'

use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

use 'vim-airline/vim-airline'
use 'tpope/vim-fugitive'

use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use 'nvim-treesitter/playground'

use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
use 'nvim-telescope/telescope-project.nvim'
use 'nvim-telescope/telescope-file-browser.nvim'

use 'nvim-lua/popup.nvim'
use 'RishabhRD/popfix'

use "lukas-reineke/indent-blankline.nvim"

use 'ParamagicDev/vim-medic_chalk'

use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

use 'theHamsta/nvim-dap-virtual-text'

use 'jose-elias-alvarez/nvim-lsp-ts-utils'

use 'vim-test/vim-test'

use 'simrat39/rust-tools.nvim'

use 'yuezk/vim-js'
use 'sbdchd/neoformat'

end)
