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
  dap_go_enabled = true,
  sanitize_output = true,
}

local javaConfig = {
  incremental_build = true
}

local plenaryConfig = {}

local neotest_lazy_config = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    'nvim-neotest/nvim-nio',
    'rcasia/neotest-java',
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",

    "rouge8/neotest-rust",
    "nvim-neotest/neotest-jest",
    {
      "fredrikaverpil/neotest-golang",
      dependencies = {
        "uga-rosa/utf8.nvim"
      }
    },
    "nvim-neotest/neotest-plenary"
  },
  config = function()
    local neotest = require 'neotest'
    local jest = require 'neotest-jest'
    local go = require 'neotest-golang'
    local plenary = require 'neotest-plenary'
    local java = require 'neotest-java'

    ---@diagnostic disable-next-line: missing-fields
    neotest.setup {
      adapters = {
        java(javaConfig),
        jest(jestConfig),
        go(goConfig),
        plenary(plenaryConfig)
      },
      discovery = {
        enabled = true,
        concurrent = 1,
      },
      ---@diagnostic disable-next-line: missing-fields
      summary = {
        count = true,
        open = "botright vsplit | set nowrap"
      },
      ---@diagnostic disable-next-line: missing-fields
      output = {
        open_on_run = false
      }
    }

    require('plugins.tests.tests')
  end,
  lazy = true,
  ft = { "rust", "typescript", "go", "lua", "java" },
}

return {
  neotest_lazy_config
}
