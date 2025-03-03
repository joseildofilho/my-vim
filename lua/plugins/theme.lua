vim.o.background = 'dark'
vim.cmd('colorscheme tokyonight-night')

local automatically_change = false

local timer = vim.loop.new_timer()
timer:start(0, 10000, vim.schedule_wrap(function()
    local hour = tonumber(os.date('%H'))
    -- You can change color scheme here.
    local bg = (hour > 8 and hour < 17) and 'light' or 'dark'
    if (vim.o.bg ~= bg) and automatically_change then vim.o.bg = bg end
end))
