return function(root)
  if vim.loop.fs_stat(root .. '.gomod') then
    return 'go'
  end

  if vim.loop.fs_stat(root .. 'init.lua') then
    return 'lua'
  end
end
