local fidget = require'fidget'
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.http"},
    callback = function(ev)
        local current_buf = ev.buf
        vim.treesitter.stop(current_buf)
        local lang = vim.treesitter.language.get_lang('http')
        local ok, err = pcall(vim.treesitter.start, current_buf, lang)
        if not ok then
            fidget.notify("We Have some error on trying to load the highlighter by the treesitter", vim.log.levels.ERROR)
            print(err)
        end
        fidget.notify("Treesitter for HTTP is loaded", vim.log.levels.INFO)
    end
})
