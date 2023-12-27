require('neotest').setup {
    discovery = {
        enabled = false
    },
    adapters = {
        require('neotest-rust') {
--            args = { "--no-capture" }
        },
        require('neotest-jest')({
            jest_test_discovery = true,
            jestConfigFile = function()
                local file = vim.fn.expand('%')
                print("testing test tested " .. file)
                print("tesled ted " .. vim.fn.getcwd())
                if string.find(file, "e2e") then
                    return "jest-integration.config.json"
                end
                return vim.fn.getcwd() .. "/jest.config.json"
            end
        }),
        require('neotest-go')({}),
    }
}

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
        print("e2e testing")
        neotest.run.run({jestCommand = "jest --config jest-integration.config.json" .. vim.fn.expand('%')})
    else
        neotest.run.run(bufferPath)
    end

end

vim.api.nvim_create_user_command('FileTest', run_file, {})
