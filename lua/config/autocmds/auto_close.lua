vim.api.nvim_create_autocmd('WinLeave', {
  pattern = {
    'Neotest Summary',
    'Neotest Output Panel'
  },
  callback = function() vim.cmd('q') end,
})
