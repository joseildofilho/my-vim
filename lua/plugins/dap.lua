require("nvim-dap-virtual-text").setup {}

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='red', linehl='', numhl=''})

local dap = require('dap')

dap.set_log_level('DEBUG')

local debugger_path
if vim.fn.has('macunix') == 1 then
    debugger_path = "/Users/joseildo.filho/.local/share/nvim/lazy/vscode-js-debug"
else
    debugger_path = "/usr/joseildo.filho/.local/share/nvim/lazy/vscode-js-debug"
end

require 'dap-go'.setup {
    dap_configurations = {
        {
            type = "go",
            name = "Debug main.go",
            request = "launch",
            program = "${workspaceFolder}/main.go",
            -- buildFlags = require("dap-go").get_build_flags,
        },
    },
}

require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = debugger_path,                                                               -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    --log_file_path = "(stdpath cache)/dap_vscode_js.log", -- Path for file logging
    log_file_level = vim.log.levels.ERROR,                                                       -- Logging level for output to file. Set to false to disable file logging.
    log_console_level = vim.log.levels
        .ERROR                                                                                   -- Logging level for output to console. Set to false to disable console output.
})

--dap.adapters.node = {
--    type = "executable",
--    command = "node",
--    --args = { debugger_location .. "/out/src/nodeDebug.js" },
-- }

for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            --program = "${workspaceFolder}/src/main.ts",
            runtimeExecutable = "npm",
            runtimeArgs = { "run", "start:local" },
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        }
    }
end


dap.adapters.dart = {
    type = "executable",
    command = "flutter",
    args = { "debug_adapter" }
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

local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
