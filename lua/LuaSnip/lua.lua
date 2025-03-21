local fmta = require('luasnip.extras.fmt').fmta
local r = require('luasnip.extras').rep
local i = require('luasnip').insert_node
local s = require('luasnip').snippet

return {
    s({ trig = "trig", dscr = "creates a basic trigger" }, fmta([[ s({ trig = "", dscr = "creates a basic trigger" }, fmta(\[\[\]\], {})) ]], {}))
}
