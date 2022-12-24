local awful = require('awful')
local widgets = require('widgets')
local create_left_wibox = require('Left_Bar.create_left_wibox')
local set_wallpaper = require('utils.set_wallpaper')

awful.screen.connect_for_each_screen(
    function(s)
        set_wallpaper(s)
        widgets.layoutbox(s)
        widgets.taglist(s)
        widgets.tasklist(s)
        create_left_wibox(s)
    end
)
