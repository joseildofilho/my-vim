local Path = require("plenary").path
M = {
  bufs = {},
}

M.load_requests_folder = function()
  local data_folder = vim.fn.stdpath("data")
  local requests_folder = Path:new(data_folder .. "/requests")
  if not requests_folder:exists() then
    requests_folder:mkdir()
  end
end

M.create_request_file = function(self, args)
  local request_name = args['args']
  local data_folder = vim.fn.stdpath("data")
  local requests_folder = Path:new(data_folder .. "/requests")
  if not requests_folder:exists() then
    requests_folder:mkdir()
  end

  local request_file = requests_folder:joinpath(request_name .. ".http")
  local buf
  if not self.bufs[request_file.filename] then
    buf = vim.api.nvim_create_buf(false, false)
    self.bufs[request_file.filename] = buf
    vim.api.nvim_buf_set_name(buf, request_file.filename)
  else
    buf = self.bufs[request_file.filename]
  end

  local width = 150
  local height = 50
  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_set_option_value('number', true, { win = win })
  vim.api.nvim_set_option_value('relativenumber', true, { win = win })

  if request_file:exists() then
    vim.cmd("edit " .. request_file.filename)
  end
end

vim.api.nvim_create_user_command('HttpCreateFile', function(args)
  M:create_request_file(args)
end, { nargs = "?" })

return M
