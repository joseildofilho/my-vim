local nougat = require("nougat")
local core = require("nougat.core")
local Bar = require("nougat.bar")
local Item = require("nougat.item")
local sep = require("nougat.separator")

local nut = {
    buf = {
        diagnostic_count = require("nougat.nut.buf.diagnostic_count").create,
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

local mode = nut.mode({
    prefix = " ",
    suffix = " ",
    sep_right = sep.right_lower_triangle_solid(true),
    config = {
        highlight = {
            normal = { bg = color.bg1, fg = color.blue },
            insert = { bg = "#78ccc5" },
            visual = { bg = "#9745be" },
        }
    }
})

local stl = Bar("statusline")
stl:add_item(mode)
stl:add_item(nut.git.branch({
    hl = { bg = color.magenta, fg = color.bg },
    prefix = "  ",
    suffix = " ",
    sep_right = sep.right_lower_triangle_solid(true),
}))
stl:add_item(nut.git.status.create({
    hl = { bg = color.bg1 },
    content = {
        nut.git.status.count("added", {
            hl = { fg = color.green },
            prefix = " +",
        }),
        nut.git.status.count("changed", {
            hl = { fg = color.blue },
            prefix = " ~",
        }),
        nut.git.status.count("removed", {
            hl = { fg = color.red },
            prefix = " -",
        }),
    },
    suffix = " ",
    sep_right = sep.right_lower_triangle_solid(true),
}))

stl:add_item(nut.spacer())
stl:add_item(nut.truncation_point())
stl:add_item(nut.buf.diagnostic_count({
    hidden = false,
    hl = { bg = color.red, fg = color.bg },
    sep_left = sep.left_lower_triangle_solid(true),
    prefix = " ",
    suffix = " ",
    config = {
        severity = vim.diagnostic.severity.ERROR,
    },
}))
stl:add_item(nut.buf.diagnostic_count({
    hidden = false,
    hl = { bg = color.yellow, fg = color.bg },
    sep_left = sep.left_lower_triangle_solid(true),
    prefix = " ",
    suffix = " ",
    config = {
        severity = vim.diagnostic.severity.WARN,
    },
}))
stl:add_item(nut.buf.diagnostic_count({
    hidden = false,
    hl = { bg = color.blue, fg = color.bg },
    sep_left = sep.left_lower_triangle_solid(true),
    prefix = " ",
    suffix = " ",
    config = {
        severity = vim.diagnostic.severity.INFO,
    },
}))
stl:add_item(nut.buf.diagnostic_count({
    hl = { bg = color.green, fg = color.bg },
    sep_left = sep.left_lower_triangle_solid(true),
    prefix = " ",
    suffix = " ",
    config = {
        severity = vim.diagnostic.severity.HINT,
    },
}))
stl:add_item(nut.buf.filetype({
    hl = { bg = color.bg1 },
    sep_left = sep.left_lower_triangle_solid(true),
    prefix = " ",
    suffix = " ",
}))
stl:add_item(Item({
    hl = { bg = color.bg2, fg = color.blue },
    sep_left = sep.left_lower_triangle_solid(true),
    prefix = "  ",
    content = core.group({
        core.code("l"),
        ":",
        core.code("c"),
    }),
    suffix = " ",
}))
stl:add_item(Item({
    hl = { bg = color.blue, fg = color.bg },
    sep_left = sep.left_lower_triangle_solid(true),
    prefix = " ",
    content = core.code("P"),
    suffix = " ",
}))

local stl_inactive = Bar("statusline")
stl_inactive:add_item(mode)

nougat.set_statusline(function(ctx)
    return ctx.is_focused and stl or stl_inactive
end)
