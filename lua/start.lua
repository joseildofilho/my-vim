local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('plugins')

require('plugins.complete')
--require('plugins.ident')
require('plugins.dap')
--require('plugins.popfix')
--require('plugins.rest')
require('plugins.projections')
require('plugins.tests')
--require('plugins.neotest')
require('plugins.theme')
--require('plugins.telescope')
require('plugins.lsp-utils')
--
require('overseer').setup()
require('dressing').setup()
--require('telescope').load_extension('flutter')
--require('hop').setup()
require('lualine').setup{
    options = {
        globalstatus=true
    },
}

require("nvim-tree").setup{
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
require("prettier").setup{}
--
-- require("flutter-tools").setup{
--     -- debugger = {
--     --     enabled = false,
--     --     run_via_dap = true,
--     --     register_configurations = function(_)
--     --         require'plugins.dap'
--     --     end,
--     -- },
--     dev_log = {
--         enabled = true,
--         open_cmd = "tabedit"
--     },
--     fvm=true,
--     lsp = {
--         color = {
--             enabled = false
--         }
--     }
-- }
--
---- vim.lsp.set_log_level("debug")
--
vim.wo.number = true
vim.wo.relativenumber = true
--
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c" },  -- list of language that will be disabled
  },
}

