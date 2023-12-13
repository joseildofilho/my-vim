require('neotest').setup {
    adapters = {
        require('neotest-rust') {
--            args = { "--no-capture" }
        },
        require('neotest-jest')({}),
        require('neotest-go')({}),
    }
}
