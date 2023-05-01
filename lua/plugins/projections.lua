require('projections').setup{
    workspaces = {
        "~/Codigos/Swipe/main",
        "~/.config"
    },
}
require('telescope').load_extension('projections')
