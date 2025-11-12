local force_treesitter_to_start = function(ev)
  local fidget = require 'fidget'

  local current_buf = ev.buf
  vim.treesitter.stop(current_buf)
  local lang = vim.treesitter.language.get_lang('go')
  local ok, err = pcall(vim.treesitter.start, current_buf, lang)
  if not ok then
    fidget.notify("We Have some error on trying to load the highlighter by the treesitter", vim.log.levels.ERROR)
    print(err)
  end
end

return {
  on_attach = force_treesitter_to_start,
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  cmd = { 'gopls' },
  root_markers = {
    '.git',
    'go.mod',
    'go.sum',
  },
}
