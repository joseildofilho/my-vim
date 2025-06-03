return {
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  cmd = { 'gopls' },
  root_markers = {
    '.git',
    'go.mod',
    'go.sum',
  },
}
