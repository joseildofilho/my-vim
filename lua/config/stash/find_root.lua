local markers = {
  "go.mod",
  "init.lua",
  ".git"
}

return function()
  local path = vim.fn.expand '%:p:h'
  for _, marker in ipairs(markers) do
    local found = vim.fs.find(marker, {
      upward = true,
      path = path,
    })[1]

    if found then
      return vim.fs.dirname(found)
    end
  end
end
