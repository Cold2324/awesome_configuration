local awful = require('awful')
local gears = require('gears')
local screen_menu = require('utils.screen_menu')

root.buttons(gears.table.join(
    awful.button({}, 3, function() screen_menu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))
