local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
  '.git',
}

return {
  filetypes = { 'lua' },
  root_markers = root_files,
  cmd = { 'lua-language-server' },
}
