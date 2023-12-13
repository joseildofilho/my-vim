local neotest = require('neotest')

function nearest()
    local bufferPath = vim.fn.expand('%')
    if(string.find(bufferPath, 'component')) then
        vim.cmd([[let test#javascript#jest#executable = 'jest --runInBand --config jest-component.config.json']])
    end
    if(string.find(bufferPath, 'e2e')) then
        vim.cmd([[let test#javascript#jest#executable = 'jest --runInBand --config jest-integration.config.json']])
    end
    vim.cmd([[:TestNearest]])
end

vim.api.nvim_create_user_command('Nearest', nearest, {})

function run_file()
    neotest.summary.open()
    local bufferPath = vim.fn.expand('%')
    if(string.find(bufferPath, 'e2e')) then
        -- vim.cmd([[let test#javascript#jest#executable = 'jest --runInBand --config jest-integration.config.json']])
        neotest.run.run({vim.fn.expand('%'), jestConfigFile = "jest-integration.config.json"})
    else
        neotest.run.run(bufferPath)
    end

end

vim.api.nvim_create_user_command('FileTest', run_file, {})
