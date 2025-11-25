return {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "make tiktoken",
      opts = {
        model = "claude-sonnet-4.5",
        prompts = {
          PrDescription = {
            prompt =
            [[
#gitdiff:master
#buffer:visible
Write the PR description
            ]],
          }
        }
      },
    },
  }
