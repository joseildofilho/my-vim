local neotest = require('neotest')
local fidget = require 'fidget'

local function toggle_summary()
    neotest.summary.toggle()
end
vim.api.nvim_create_user_command('ToggleSummary', toggle_summary, {})

local function toggle_output_panel()
    neotest.output_panel.toggle()
end
vim.api.nvim_create_user_command('ToggleOutputPanel', toggle_output_panel, {})

local function nearest()
    neotest.summary.open()
    neotest.output_panel.clear()

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
    neotest.summary.open()
    neotest.output_panel.clear()

    local bufferPath = vim.fn.expand('%')
    if (string.find(bufferPath, 'e2e')) then
        print("e2e testing")
        neotest.run.run({ jestCommand = "jest --config jest-integration.config.json", strategy = 'dap'})
    else
        neotest.run.run({strategy =  'dap'})
    end
end
vim.api.nvim_create_user_command('NearestDebugMode', nearest, {})

local function run_file()
    neotest.summary.open()
    neotest.output_panel.clear()

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

local function stop_current_test_after_write(_)
    neotest.run.stop()
    fidget.notify('Parando execução de tests após salvar', vim.log.levels.INFO)
end
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = { "*.js", "*.ts", "*.tsx", "*_test.go" },
    callback = stop_current_test_after_write,
})

-- local function create_test_file()
--     local current_workspace = vim.fn.getcwd()
--     local file_path = vim.api.nvim_buf_get_name(4):match(current_workspace .. '/(.*)')
-- end
