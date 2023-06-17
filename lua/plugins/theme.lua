require('kanagawa').setup{
    background = {
        dark = "wave",
        light = "lotus"
    },
    transparent=false
}
vim.o.background = 'light'
vim.cmd('colorscheme kanagawa-lotus')

local timer = vim.loop.new_timer()
timer:start(0, 10000, vim.schedule_wrap(function()
  local hour = tonumber(os.date('%H'))
  -- You can change color scheme here.
  local bg = (hour > 8 and hour < 19) and 'light' or 'dark'
  if vim.o.bg ~= bg then vim.o.bg = bg end
end))
