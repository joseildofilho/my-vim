vim.api.nvim_create_user_command('Format', function()
  require 'conform'.format()
end, {})
