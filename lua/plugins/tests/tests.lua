local neotest = require('neotest')
local fidget = require 'fidget'

local function stop_current_test()
    neotest.output_panel.clear()
    neotest.run.stop()
end

local function toggle_summary()
    neotest.summary.toggle()
end

local function toggle_output_panel()
    neotest.output_panel.toggle()
end

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

local function last_test()
    stop_current_test()
    neotest.run.run_last({ strategy = 'integrated' })
end

local function last_test_debug_mode()
    stop_current_test()
    neotest.run.run_last({ strategy = 'dap' })
end

local function stop_current_test_after_write(_)
    stop_current_test()
    fidget.notify('Parando execução de tests após salvar', vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('ToggleSummary', toggle_summary, {})
vim.api.nvim_create_user_command('ToggleOutputPanel', toggle_output_panel, {})
vim.api.nvim_create_user_command('Nearest', nearest, {})
vim.api.nvim_create_user_command('NearestDebugMode', nearest_debug, {})
vim.api.nvim_create_user_command('FileTest', run_file, {})
vim.api.nvim_create_user_command('TestLast', last_test, {})
vim.api.nvim_create_user_command('TestLastDebugMode', last_test_debug_mode, {})
vim.api.nvim_create_user_command('TestStopCurrent', stop_current_test, {})

vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = { "*.js", "*.ts", "*.tsx", "*_test.go" },
    callback = stop_current_test_after_write,
})

vim.api.nvim_create_autocmd('WinLeave', {
  pattern = '*Neotest Summary*',
  callback = function() vim.cmd('q') end,
})
