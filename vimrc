set number relativenumber
set nocompatible
set encoding=utf-8
set listchars=tab:\|\
set list
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a

set guifont="Fira Code Nerd Font:b"


set updatetime=300

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

syntax on
let g:lsc_auto_map = v:true
let g:neovide_cursor_vfx_mode = "sonicboom"
let g:neovide_cursor_trail_size = 0.9
let g:neovide_cursor_animation_length = 0.13

map <SPACE> <leader>

nnoremap <leader>mn :bn<CR>
nnoremap <leader>mN :bp<CR>
nnoremap <leader>md :bn \| bd#<CR>
nnoremap <leader>mD :bd<CR>
nnoremap <leader>mc :bufdo bd<CR>

nmap     <silent> <leader>gt        :vsp<CR><Cmd>lua vim.lsp.buf.definition()<CR>
nmap                      gd        <Cmd>lua vim.lsp.buf.definition()<CR>
nmap                      <C-Space> <Cmd>lua vim.lsp.buf.code_action()<CR>
nmap     <silent>         gi        <CMD>lua vim.lsp.buf.implementation()<CR>
nmap                      gk        <Cmd>lua vim.diagnostic.goto_prev()<CR>
nmap                      gj        <Cmd>lua vim.diagnostic.goto_next()<CR>
nmap     <silent> <leader>gr        <CMD>lua vim.lsp.buf.references()<CR>
nmap     <silent>         <F6>      <CMD>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>gf        <CMD>lua vim.lsp.buf.format()<CR>
nnoremap          <leader>gm        <CMD>lua vim.lsp.buf.signature_help()<CR>

nmap <space>e <cmd>lua vim.diagnostic.open_float()<CR>
nmap <space>q <cmd>lua vim.diagnostic.setloclist()<CR>

nnoremap <silent> <leader>Dc :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>Ds :lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>Di :lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>Do :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b  :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>D  :lua require'dapui'.toggle()<CR>

nnoremap <leader>gss :lua require'plugins.popfix'.select_services()<CR>

" git
nmap <silent> gs :G<CR>

nnoremap <leader>fa :FlutterRun -d all<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
nnoremap <leader>fd <CMD> lua require'dap'.continue()<CR>
nnoremap <leader>ff <cmd> lua require('telescope').extensions.flutter.commands()<CR>

let test#dart#fluttertest#executable = 'fvm flutter test'
"let test#javascript#jest#executable = 'jest --runInBand --config jest-integration.config.json' 
nmap <silent> <leader>tn :Nearest<CR>
nmap <silent> <leader>tf :FileTest<CR>
nmap <silent> <leader>tt :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" Find files using Telescope command-line sugar.
nnoremap          <leader>F   <cmd>Telescope find_files<cr>
nnoremap          <leader>fg  <cmd>Telescope live_grep<cr>
nnoremap          <leader>fb  <cmd>Telescope buffers<cr>
nnoremap          <leader>fh  <cmd>Telescope help_tags<cr>
nnoremap          <leader>fl  <cmd>Telescope git_files<cr>
nnoremap          <leader>fm  <cmd>:NvimTreeToggle<cr>
nnoremap          <leader>ccc <cmd>lua require'telescope.builtin'.find_files({cwd = '~/.config/nvim'})<cr>
nnoremap <silent> <leader>p   <cmd>Telescope projections<cr>

nnoremap <silent> <leader>TT   <cmd>OverseerRun<cr>
nnoremap <silent> <leader>Ts   <cmd>OverseerToggle<cr>

nnoremap <leader>htp  <cmd>lua require'rest-nvim'.run()<cr>
nnoremap <leader>htl <cmd>lua require'rest-nvim'.run()<cr>

nnoremap <leader>rr :source ~/.config/nvim/init.vim<CR>

nnoremap <D-v> "+p

nnoremap <C-t> :rightb vsp +te <CR>

nnoremap  f :HopChar1CurrentLine<cr>
nnoremap  F :HopAnywhere<cr>

tnoremap <Esc> <C-\><C-n>

" g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
"let g:neovide_transparency=0.0
"let g:transparency = 0.85
"let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

highlight CursorLine ctermbg=0 ctermbg=235

"autocmd BufWritePre *.ts Prettier
