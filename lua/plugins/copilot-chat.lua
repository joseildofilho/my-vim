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
You're an brazilian elite programmer, which are well versed in portuguese and grammar.

temperature: 0.3

Write the PR description following the template bellow, be consise and simple.
Also, be a bit more fluid and produce an explanation for jira.

### Motivo


### O que foi feito
*

### Links
[Descrição](link)

@ContaAzul/ca-ip

---
[Formatação](https://google.github.io/styleguide/javaguide.html) | [Karma](https://karma-runner.github.io/4.0/dev/git-commit-msg.html)
            ]],
          }
        }
      },
    },
  }
