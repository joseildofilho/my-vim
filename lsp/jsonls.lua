local add_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  vim.lsp.config('jsonls', {
    capabilities = capabilities,
  })
end

return {
  on_attach = add_capabilities,
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  cmd = { 'gopls' },
  root_markers = {
    '.git',
    'go.mod',
    'go.sum',
  },
}
