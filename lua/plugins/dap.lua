require("dapui").setup{}
require("nvim-dap-virtual-text").setup{}

local dap = require('dap')

dap.adapters.dart = {
    type = "executable",
    command = "flutter",
    args = {"debug_adapter"}
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    program = "${file}",
    cwd = "${workspaceFolder}",
    toolArgs = { "-d", "all" }
  }
}

