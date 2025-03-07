local nougat = require("nougat")
local core = require("nougat.core")
local Bar = require("nougat.bar")
local Item = require("nougat.item")
local sep = require("nougat.separator")

local nut = {
    buf = {
        diagnostic_count = require("nougat.nut.buf.diagnostic_count").create,
        filename = require("nougat.nut.buf.filename").create,
        filestatus = require("nougat.nut.buf.filestatus").create,
        filetype = require("nougat.nut.buf.filetype").create,
    },
    git = {
        branch = require("nougat.nut.git.branch").create,
        status = require("nougat.nut.git.status"),
    },
    tab = {
        tablist = {
            tabs = require("nougat.nut.tab.tablist").create,
            close = require("nougat.nut.tab.tablist.close").create,
            icon = require("nougat.nut.tab.tablist.icon").create,
            label = require("nougat.nut.tab.tablist.label").create,
            modified = require("nougat.nut.tab.tablist.modified").create,
        },
    },
    mode = require("nougat.nut.mode").create,
    spacer = require("nougat.nut.spacer").create,
    truncation_point = require("nougat.nut.truncation_point").create,
}

---@type nougat.color
local color = require("nougat.color").get()



local line = Bar('winbar')
line:add_item(nut.buf.filename({
    hl = { bg = color.bg1, fg = color.blue },
    prefix = " ",
    suffix = " ",
}))
line:add_item(nut.buf.filestatus({
    hl = { bg = color.bg1 },
    suffix = " ",
    sep_right = sep.right_chevron_solid(true),
    config = {
        modified = "󰏫",
        nomodifiable = "󰏯",
        readonly = "",
        sep = " ",
    },
}))
line:add_item(Item({
    hl = { bg = color.bg2, fg = color.blue },
    sep_right = sep.right_chevron_solid(true),
    prefix = " ",
    content = function ()
        local hooks = #require'harpoon':list().items
        if hooks > 0 then
            return "🪝" .. hooks .. " "
        end
    end,
    suffix = " ",
}))

nougat.set_winbar(line)
