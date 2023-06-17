require('projections').setup{
    workspaces = {
        "~/Codigos/Swipe/main",
        "~/Codigos/Tijolo",
        "~/Codigos/Gavial",
        "~/Codigos/Calango",
        "~/Codigos/Joseildo",
        "~/.config",
        "~/.aws",
    },
}
require('telescope').load_extension('projections')
