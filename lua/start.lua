require('plugins')
require('plugins.complete')
require('plugins.ident')
require('plugins.dap')
require('plugins.popfix')
require('plugins.rest')
require('plugins.projections')
require('plugins.tests')
require('plugins.neotest')

require('overseer').setup()

require('dressing').setup()

require('plugins.telescope')
require('telescope').load_extension('flutter')
require('hop').setup()
require('lualine').setup()

require('kanagawa').setup{
    background = {
        dark = "wave",
        light = "lotus"
    },
    transparent=false
}
vim.o.background = 'light'
vim.cmd('colorscheme kanagawa-lotus')

require("elixir").setup{}

require("nvim-tree").setup{
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
require("prettier").setup{}

require("flutter-tools").setup{
    -- debugger = {
    --     enabled = false,
    --     run_via_dap = true,
    --     register_configurations = function(_)
    --         require'plugins.dap'
    --     end,
    -- },
    dev_log = {
        enabled = true,
        open_cmd = "tabedit"
    },
    lsp = {
        color = {
            enabled = false
        }
    }
}

-- vim.lsp.set_log_level("debug")

vim.wo.number = true
vim.wo.relativenumber = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.termguicolors = true


require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c" },  -- list of language that will be disabled
  },
}

