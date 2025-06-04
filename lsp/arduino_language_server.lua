local root_files = {
  '*.ino',
}

return {
  filetypes = { 'arduino' },
  root_markers = root_files,
  cmd = { 'arduino-language-server', '--cli-config', '/Users/joseildo.filho/Library/Arduino15/arduino-cli.yaml' },
}
