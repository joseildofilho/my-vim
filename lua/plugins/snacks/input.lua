local function snack_input()
    require('snacks').input.input({
        prompt = 'CMD',
    }, function(value)
        if value then
            vim.cmd(value)
        end
    end)
end
vim.api.nvim_create_user_command('SnackInput', snack_input, {})

return {
    enabled = false,
    icon = '',
    row = 50,
    prompt_pos = 'left',
    win = {
        row = vim.api.nvim_win_get_height(0) / 2,
    }
}
