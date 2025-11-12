return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      highlight = {
        "Function"
      }
    },
    scope = {
      highlight = {
        "Function"
      },
      enabled = true,
      include = {
        node_type = {
          ['*'] = {}
        }
      }
    }
  },
}
