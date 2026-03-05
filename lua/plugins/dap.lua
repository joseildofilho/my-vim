require("nvim-dap-virtual-text").setup {}

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='red', linehl='', numhl=''})

local dap = require('dap')

dap.set_log_level('DEBUG')

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
