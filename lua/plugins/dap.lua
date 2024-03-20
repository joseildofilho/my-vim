require("dapui").setup{}
require("nvim-dap-virtual-text").setup{}

local dap = require('dap')
dap.set_log_level('TRACE')
require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "/Users/joseildo.filho/.local/share/nvim/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  log_file_path = "(stdpath cache)/dap_vscode_js.log", -- Path for file logging
  log_file_level = vim.log.levels.ERROR, -- Logging level for output to file. Set to false to disable file logging.
  log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      --program = "${workspaceFolder}/src/main.ts",
      runtimeExecutable="npm",
      runtimeArgs={"run", "start:local"},
      cwd = "${workspaceFolder}",
      sourceMaps=true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    }
  }
end

 
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

