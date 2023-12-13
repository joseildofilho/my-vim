
require('projections').setup{
    workspaces = {
        "~/Codigos/Swipe/main",
        "~/Codigos/Tijolo",
        "~/Codigos/Gavial",
        "~/Codigos/Calango",
        "~/Codigos/Joseildo",
        "~/Codigos/Joseildo/julia/",
        "~/Codigos/Joseildo/nannou/",
        "~/Codigos/Pima",
        "~/.config",
        "~/.aws",
    },
    restore_hooks = {
        pre = function() 
            local tree_api = require('nvim-tree.api')
            tree_api.tree.close()
        end
    },
}
 -- Autostore session on VimExit
local Session = require("projections.session")
vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
    callback = function() Session.store(vim.loop.cwd()) end,
})
    
-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
    end,
})

vim.opt.sessionoptions:append("localoptions")

require('telescope').load_extension('projections')
