require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node%_modules/.*", "dist/.*", "build/.*", "deps/.*" },
        path_display = {"smart"}
    },
    extensions = {
        project = {
            base_dirs = {
                --'~/Codigos/Swipe/main/',
                '~/Codigos/Gavial/',
                '~/Codigos/Tijolo/',
            }
        }
    }
}


