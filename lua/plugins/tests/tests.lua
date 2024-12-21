local neotest = require('neotest')
local fidget = require 'fidget'

local function stop_current_test()
    neotest.output_panel.clear()
    neotest.run.stop()
end

local function toggle_summary()
    neotest.summary.toggle()
end
vim.api.nvim_create_user_command('ToggleSummary', toggle_summary, {})

local function toggle_output_panel()
    neotest.output_panel.toggle()
end
vim.api.nvim_create_user_command('ToggleOutputPanel', toggle_output_panel, {})

local function nearest()
    stop_current_test()
    local bufferPath = vim.fn.expand('%')
    if (string.find(bufferPath, 'e2e')) then
        print("e2e testing")
        neotest.run.run({ jestCommand = "jest --config jest-integration.config.json" })
    else
        neotest.run.run()
    end
end
vim.api.nvim_create_user_command('Nearest', nearest, {})

local function nearest_debug()
    stop_current_test()
    local bufferPath = vim.fn.expand('%')
    if (string.find(bufferPath, 'e2e')) then
        print("e2e testing")
        neotest.run.run({ jestCommand = "jest --config jest-integration.config.json", strategy = 'dap' })
    else
        neotest.run.run({ strategy = 'dap' })
    end
end
vim.api.nvim_create_user_command('NearestDebugMode', nearest_debug, {})

local function run_file()
    stop_current_test()
    local bufferPath = vim.fn.expand('%')
    if (string.find(bufferPath, 'e2e')) then
        -- vim.cmd([[let test#javascript#jest#executable = 'jest --runInBand --config jest-integration.config.json']])
        print("e2e testing")
        neotest.run.run({ jestCommand = "jest --config jest-integration.config.json" .. vim.fn.expand('%') })
    else
        neotest.run.run(bufferPath)
    end
end
vim.api.nvim_create_user_command('FileTest', run_file, {})

local function last_test()
    stop_current_test()
    neotest.run.run_last({ strategy = 'integrated' })
end
vim.api.nvim_create_user_command('TestLast', last_test, {})

local function last_test_debug_mode()
    stop_current_test()
    neotest.run.run_last({ strategy = 'dap' })
end
vim.api.nvim_create_user_command('TestLastDebugMode', last_test_debug_mode, {})

local function stop_current_test_after_write(_)
    stop_current_test()
    fidget.notify('Parando execução de tests após salvar', vim.log.levels.INFO)
end
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = { "*.js", "*.ts", "*.tsx", "*_test.go" },
    callback = stop_current_test_after_write,
})
