local M = {}
local file = vim.fn.stdpath 'config' .. '/lua/config/stash/projects.json'
local find_root = require 'config.stash.find_root'

function M.load()
  local f = io.open(file, "r")
  if not f then return {} end

  local content = f:read('*a')
  f:close()

  return vim.json.decode(content)
end

function M.init()
  local root = find_root()
  if not root then return end

  local projects = M.load()

  for _, proj in pairs(projects) do
    if proj.proj == root then
      vim.g.project = proj
    end
  end
  return M
end

return M
