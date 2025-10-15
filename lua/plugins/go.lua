return {
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
}
