return {
    '2kabhishek/exercism.nvim',
    cmd = { 'Exercism' },
    dependencies = {
        '2kabhishek/utils.nvim', -- required, for utility functions
        '2kabhishek/termim.nvim', -- optional, better UX for running tests
    },
    opts = {
      exercism_workspace = '~/Codigos/Joseildo/exercism',
    },
}
