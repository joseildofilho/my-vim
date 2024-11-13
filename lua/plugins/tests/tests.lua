local neotest = require('neotest')
local fidget = require 'fidget'

local function nearest()
    local bufferPath = vim.fn.expand('%')
    if (string.find(bufferPath, 'component')) then
        vim.cmd([[let test#javascript#jest#executable = 'jest --runInBand --config jest-component.config.json']])
    end
    if (string.find(bufferPath, 'e2e')) then
        vim.cmd([[let test#javascript#jest#executable = 'jest --runInBand --config jest-integration.config.json']])
    end
    vim.cmd([[:TestNearest]])
end

vim.api.nvim_create_user_command('Nearest', nearest, {})

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
    pattern = { "*.js", "*.ts", "*.tsx", "*.go" },
    callback = stop_current_test_after_write,
})
