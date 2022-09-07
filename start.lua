require('plugins')
require('plugins.complete')
require('plugins.ident')
require('plugins.dap')
require('plugins.telescope')
require('plugins.popfix')
require("telescope").load_extension("flutter")
require("flutter-tools").setup{
    debugger = {
        enabled = true,
        run_via_dap = true,
        register_configurations = function(_)
            require'plugins.dap'
        end,
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabnew"
  }
}

vim.lsp.set_log_level("debug")

vim.wo.number = true
vim.wo.relativenumber = true

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
