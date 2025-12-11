local nougat = require("nougat")
local Bar = require("nougat.bar")
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

local tal = Bar("tabline")

tal:add_item(nut.tab.tablist.tabs({
    active_tab = {
        hl = { bg = color.bg, fg = color.blue },
        prefix = " ",
        suffix = " ",
        content = {
            nut.tab.tablist.icon({ suffix = " " }),
            nut.tab.tablist.label({}),
            nut.tab.tablist.modified({ prefix = " ", config = { text = "●" } }),
            nut.tab.tablist.close({ prefix = " ", config = { text = "󰅖" } }),
        },
        sep_right = sep.right_lower_triangle_solid(true),
    },
    inactive_tab = {
        hl = { bg = color.bg2, fg = color.fg2 },
        prefix = " ",
        suffix = " ",
        content = {
            nut.tab.tablist.icon({ suffix = " " }),
            nut.tab.tablist.label({}),
            nut.tab.tablist.modified({ prefix = " ", config = { text = "●" } }),
            nut.tab.tablist.close({ prefix = " ", config = { text = "󰅖" } }),
        },
        sep_right = sep.right_lower_triangle_solid(true),
    },
}))

nougat.set_tabline(tal)
