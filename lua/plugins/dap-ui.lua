return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    'leoluz/nvim-dap-go',
  },
  opts = {
    layouts = { {
      elements = { {
        id = "scopes",
        size = 0.33
      }, {
        id = "stacks",
        size = 0.33
      } },
      position = "left",
      size = 40
    }, {
      elements = { {
        id = "repl",
        size = 1
      } },
      position = "bottom",
      size = 10
    } }
  }
}
