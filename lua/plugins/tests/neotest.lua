local jestConfig = {
    jest_test_discovery = true,
    jestConfigFile = function()
        local file = vim.fn.expand('%')
        if string.find(file, "e2e") then
            return "jest-integration.config.json"
        end
        return vim.fn.getcwd() .. "/jest.config.json"
    end
}

local goConfig = {
    dap_go_enabled = true
}

local neotest_lazy_config = {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-neotest/nvim-nio',
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",

        "rouge8/neotest-rust",
        "nvim-neotest/neotest-jest",
        "fredrikaverpil/neotest-golang",
    },
    config = function()
        local neotest = require 'neotest'
        local jest = require 'neotest-jest'
        local go = require 'neotest-golang'

        neotest.setup {
            adapters = {
                jest(jestConfig),
                go(goConfig)
            }
        }

        require('plugins.tests.tests')
    end,
    lazy = true,
    ft = { "rust", "typescript", "go" },
    opts = {
        discovery = {
            enabled = false
        }
    }
}

return {
    neotest_lazy_config
}
