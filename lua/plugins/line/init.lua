return {
    "MunifTanjim/nougat.nvim",
    dependencies = {
        'mvllow/modes.nvim',
    },
    config = function()
        require 'plugins.line.statusline'
        require 'plugins.line.tabline'
        require 'plugins.line.winline'
    end
}
