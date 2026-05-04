return {
  'rebelot/kanagawa.nvim',
  {
    'folke/tokyonight.nvim'
  },
  {
    'vague2k/vague.nvim',
    opts = {
      style = {
        strings = "none",
      }
    }
  },
  {
    'neg-serg/neg.nvim',
    lazy = false,
    priority = 1000,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'felipefdl/warm-burnout',
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. '/nvim')
    end,
  }
}
