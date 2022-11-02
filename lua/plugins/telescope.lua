require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node%_modules/.*", "dist/.*" }
    },
    extensions = {
        project = {
            base_dirs = {
                '~/Codigos/Swipe/',
                '~/Codigos/Swipe/main/',
                '~/Codigos/Gavial/',
                '~/Codigos/Tijolo/',
                {'~/Codigos/Joseildo/', max_depth = 1},
            }
        },
        file_browser = {
            cwd_to_path = true
        }
    }
}


