return {
  {
    "L3MON4D3/LuaSnip",
    version = "v1.*",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/LuaSnip/" } })
    end
  },
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
    opts = {
      snippetDir = "~/.config/nvim/lua/LuaSnip/",
    }
  },
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
}
