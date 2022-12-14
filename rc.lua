--[[
╭━━━╮╭╮╭╮╭╮╭━━━╮╭━━━╮╭━━━╮╭━╮╭━╮╭━━━╮╱╱╱╱╭━━━╮╭━╮╱╭╮╭━━━╮╭━━━╮╭━━━╮╭━━━╮╭╮╭━╮
┃╭━╮┃┃┃┃┃┃┃┃╭━━╯┃╭━╮┃┃╭━╮┃┃┃╰╯┃┃┃╭━━╯╱╱╱╱┃╭━╮┃┃┃╰╮┃┃┃╭━━╯╰╮╭╮┃┃╭━╮┃┃╭━╮┃┃┃┃╭╯
┃┃╱┃┃┃┃┃┃┃┃┃╰━━╮┃╰━━╮┃┃╱┃┃┃╭╮╭╮┃┃╰━━╮╱╱╱╱┃┃╱┃┃┃╭╮╰╯┃┃╰━━╮╱┃┃┃┃┃┃╱┃┃┃╰━╯┃┃╰╯╯
┃╰━╯┃┃╰╯╰╯┃┃╭━━╯╰━━╮┃┃┃╱┃┃┃┃┃┃┃┃┃╭━━╯╭━━╮┃┃╱┃┃┃┃╰╮┃┃┃╭━━╯╱┃┃┃┃┃╰━╯┃┃╭╮╭╯┃╭╮┃
┃╭━╮┃╰╮╭╮╭╯┃╰━━╮┃╰━╯┃┃╰━╯┃┃┃┃┃┃┃┃╰━━╮╰━━╯┃╰━╯┃┃┃╱┃┃┃┃╰━━╮╭╯╰╯┃┃╭━╮┃┃┃┃╰╮┃┃┃╰╮
╰╯╱╰╯╱╰╯╰╯╱╰━━━╯╰━━━╯╰━━━╯╰╯╰╯╰╯╰━━━╯╱╱╱╱╰━━━╯╰╯╱╰━╯╰━━━╯╰━━━╯╰╯╱╰╯╰╯╰━╯╰╯╰━╯
--]]

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Global Variables
user = 'cold'
config_directory = '/home/' .. user .. '/.config/awesome'
terminal = "kitty"
browser = "firefox"
files_manager = "thunar"
editor = "/usr/bin/nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod1"
-- Global Variables

local widgets = require('widgets')

require('Left_Bar.create_left_wibox')
require('configs.error_handling')
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Variable definitions
beautiful.init(config_directory .. '/theme/theme.lua')

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Manual", terminal .. " -e man awesome" },
   { "Edit config", editor_cmd .. " " .. awesome.conffile },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({
  items = {
    --{ "  Awesome", myawesomemenu },
    --{ "  Open terminal", terminal },
    --{ "  Browser", browser},
    --{ "  Files", files_manager},
    { "  Quick Awesome", function() awesome.quit() end},
    { "  Reboot", 'systemctl reboot'},
    { " ⏻ Power Off", 'systemctl poweroff'}
  }
})

mylauncher = awful.widget.launcher({
  image = config_directory .. '/assets/power_off.png',
  menu = mymainmenu
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- borders rounded
newshape = function (cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 12)
end

-- local function set_wallpaper(s)
--     -- Wallpaper
--     if beautiful.wallpaper then
--         local wallpaper = beautiful.wallpaper
--         -- If wallpaper is a function, call it with the screen
--         if type(wallpaper) == "function" then
--             wallpaper = wallpaper(s)
--         end
--         gears.wallpaper.maximized(wallpaper, s, true)
--     end
-- end

awful.screen.connect_for_each_screen(
    function(s)
        -- Wallpaper
        --set_wallpaper(s)
        -- Create a promptbox for each screen
        --s.mypromptbox = awful.widget.prompt()
        -- Create an imagebox widget which will contain an icon indicating which layout we're using.

        widgets.layoutbox(s)
        widgets.taglist(s)
        widgets.tasklist(s)
        create_left_wibox(s)
    end
)
-- }}}
-- {{{ Key bindings
require('Bindings')
-- }}}

require('configs.rules')

require('clients.signals')

os.execute(config_directory .. "/autostart.sh")
