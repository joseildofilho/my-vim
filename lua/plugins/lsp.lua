require "lsp_signature".setup()
vim.o.completeopt = 'menuone,noselect'

local cmp = require 'cmp'
local luasnip = require("luasnip")

local lspkind = require('lspkind')
local source_mapping = {
  buffer = "◉ Buffer",
  nvim_lsp = "👐 LSP",
  nvim_lua = "🌙 Lua",
  path = "🚧 Path",
  luasnip = "🌜 LuaSnip"
}

vim.api.nvim_create_user_command('LspBufFormat', function()
  if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'javascript' then
    vim.cmd [[Prettier]]
  elseif vim.bo.filetype == 'go' then
    vim.cmd [[GoFmt]]
  else
    vim.lsp.buf.format()
  end
end, {})

cmp.setup({
  preselect = cmp.PreselectMode.None,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },

  formatting = {
    expandable_indicator = true,
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      vim_item.menu = menu
      return vim_item
    end
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
})

require("luasnip/loaders/from_vscode").load()
