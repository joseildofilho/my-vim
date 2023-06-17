require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node%_modules/.*", "dist/.*", "build/.*", "deps/.*" },
        path_display = {"smart"}
    },
}


