"setlocal spell spelllang=pt,en_us
set number relativenumber
set nocompatible
set encoding=utf-8
set noswapfile
"set listchars=tab:\|\
"set list
set cursorline
set clipboard=unnamedplus

set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a

set guifont=FiraCode\ Regular:h20

let g:lazygit_floating_window_use_plenary = 1

set updatetime=100
set scrolloff=2

let g:lsc_auto_map = v:true

map <SPACE> <leader>
"nmap : <CMD>SnackInput<CR>

nnoremap <leader>RV <CMD>lua vim.cmd('source ~/.config/nvim/vimrc')<CR>

nnoremap <leader>a  <CMD>lua require'harpoon':list():add()<CR>
nnoremap <C-e>      <CMD>lua require'harpoon'.ui:toggle_quick_menu(require'harpoon':list())<CR>

nnoremap <C-j>  <CMD>lua require'harpoon':list():select(1)<CR>
nnoremap <C-k>  <CMD>lua require'harpoon':list():select(2)<CR>
nnoremap <C-l>  <CMD>lua require'harpoon':list():select(3)<CR>
nnoremap <C-;>  <CMD>lua require'harpoon':list():select(4)<CR>

nnoremap f :HopChar1CurrentLine<cr>
nnoremap F :HopAnywhere<cr>

nnoremap <leader>mn :bn<CR>
nnoremap <leader>mN :bp<CR>
nnoremap <leader>md :bN \| bd#<CR>
nnoremap <leader>mD :bd<CR>
nnoremap <leader>mc :bufdo bd<CR>

nmap     <silent> <leader>gt   :vsp<CR><Cmd>lua vim.lsp.buf.definition()<CR>
nmap                      gd   <Cmd>lua vim.lsp.buf.definition()<CR>
nmap              <leader>s    <Cmd>lua vim.lsp.buf.code_action()<CR>
nmap     <silent>         gi   <CMD>lua vim.lsp.buf.implementation()<CR>
nmap                      gk   <Cmd>lua vim.diagnostic.goto_prev()<CR>
nmap                      gj   <Cmd>lua vim.diagnostic.goto_next()<CR>
nmap     <silent> <leader>gr   <CMD>lua require'telescope.builtin'.lsp_incoming_calls()<CR>
nmap     <silent>         <F6> <CMD>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>gf   :LspBufFormat<CR>
nnoremap          <leader>gm   <CMD>lua vim.lsp.buf.signature_help()<CR>
nmap     <silent>         gq   <CMD>lua vim.diagnostic.setqflist()<CR>
nmap                      ?    <CMD>:Trouble<CR>

nmap <leader>e <cmd>lua vim.diagnostic.open_float()<CR>
nmap <leader>q <cmd>lua vim.diagnostic.setloclist()<CR>

nnoremap <silent> <F1>       :lua require'dap'.continue()<CR>
nnoremap <silent> <F2>       :lua require'dap'.step_into()<CR>
nnoremap <silent> <F3>       :lua require'dap'.step_over()<CR>
nnoremap <silent> <F4>       :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b  :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>DD :lua require'dapui'.toggle()<CR>
nnoremap <silent> <leader>B  :lua require'dapui'.float_element('breakpoints')<CR>
nnoremap <silent> <leader>Dt :lua require'dapui'.float_element('console')<CR>

" git
nmap <silent> <leader>gs :G<CR>
nmap <silent> <leader>gg :LazyGit<CR>

nnoremap <leader>fa :FlutterRun -d all<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
nnoremap <leader>fd <CMD> lua require'dap'.continue()<CR>
nnoremap <leader>ff <cmd> lua require('telescope').extensions.flutter.commands()<CR>

let test#dart#fluttertest#executable = 'fvm flutter test'
nmap <silent> <leader>tn  :Nearest<CR>
nmap <silent> <leader>tdn :NearestDebugMode<CR>
nmap <silent> <leader>tf  :FileTest<CR>
nmap <silent> <leader>tl  :TestLast<CR>
nmap <silent> <leader>tdl :TestLastDebugMode<CR>
nmap <silent> <leader>ts  :ToggleSummary<CR>
nmap <silent> <leader>to  :ToggleOutputPanel<CR>
nmap <silent> <leader>tS  :TestStopCurrent<CR>

nmap <silent> <leader>to <CMD> lua require'neotest'.output_panel.toggle()<CR>

" Find files using Telescope command-line sugar.
nnoremap          <C-F>       :lua require'telescope.builtin'.find_files({ hidden = true, no_ignore = '*.http'})<cr>
nnoremap          <C-F><C-G>  <cmd>Telescope live_grep<cr>
nnoremap          <C-F><C-B>  <cmd>Telescope buffers<cr>
nnoremap          <C-F><C-O>  <cmd>Telescope oldfiles<cr>
nnoremap          <C-F><C-H>  <cmd>Telescope help_tags<cr>
nnoremap          q:          <cmd>Telescope command_history<cr>
nnoremap          <leader>fl  <cmd>Telescope git_files<cr>
nnoremap <silent> <leader>p   <cmd>Telescope persisted<cr>

nnoremap <leader>fm  <cmd>:NvimTreeToggle<cr>
nnoremap <leader>o   <cmd>:Oil<cr>

nnoremap <leader>ccc <cmd>lua require'wezterm'.spawn('nvim', { cwd = '~/.config/nvim/'})<cr>
nnoremap <leader>ccC <cmd>:NeatermNvimConfigShortcut<cr>

nnoremap <silent> <C-g><C-g> <cmd>OverseerRun<cr>
nnoremap <silent> <C-g><C-s> <cmd>OverseerToggle<cr>

nnoremap <leader>kr <cmd>lua require'kulala'.run()<cr>
nnoremap <leader>ki <cmd>lua require'kulala'.inspect()<cr>
nnoremap <leader>kc <cmd>lua require'kulala'.from_curl()<cr>

map <leader>? <cmd>lua require('which-key').show()<CR>

nnoremap <D-v> "+p

tnoremap <leader><Esc> <C-\><C-n>

map <silent> , :lua require('nvim-window').pick()<CR>

imap <right> <cmd>lua require("copilot.suggestion").accept(modifier)<cr>

highlight CursorLine ctermbg=0 ctermbg=235

lua require'fidget'.notify("Shortcuts loaded", vim.log.levels.INFO)
