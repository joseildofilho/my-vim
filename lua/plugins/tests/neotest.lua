local neotest_lazy_config = {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",

        "rouge8/neotest-rust",
        "nvim-neotest/neotest-jest",
        "nvim-neotest/neotest-go",
    },
    config = function()
        local neotest = require 'neotest'
        local jest = require 'neotest-jest'
        local go = require'neotest-go'

        neotest.setup {
            adapters = {
                jest({
                    jest_test_discovery = true,
                    jestConfigFile = function()
                        local file = vim.fn.expand('%')
                        if string.find(file, "e2e") then
                            return "jest-integration.config.json"
                        end
                        return vim.fn.getcwd() .. "/jest.config.json"
                    end
                }),
                go
            }
        }

        require('plugins.tests.tests')
    end,
    lazy = true,
    ft = { "rust", "typescript", "go" },
    opts = {
        discovery = {
            enabled = false
        },
        --        adapters = {
        --            require('neotest-rust') {
        --                --            args = { "--no-capture" }
        --            },
        --
        --        }
    }
}

return {
    neotest_lazy_config
}
