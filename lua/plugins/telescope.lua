require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node%_modules/.*", "dist/.*" }
    },
    extensions = {
        project = {
            base_dirs = {
                '~/Codigos/Swipe/main/',
                '~/Codigos/Gavial/',
                '~/Codigos/Joseildo/'
            }
        },
        file_browser = {
            cwd_to_path = true
        }
    }
}


