function nearest()
    local bufferPath = vim.fn.expand('%')
    print(bufferPath)
    if(string.find(bufferPath, 'component')) then
        vim.cmd([[let test#javascript#jest#executable = 'jest --runInBand --config jest-component.config.json']])
    end
    vim.cmd([[:TestNearest]])
end

vim.api.nvim_create_user_command('Nearest', nearest, {})
