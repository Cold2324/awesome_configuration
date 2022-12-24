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
require("awful.autofocus")
local beautiful = require("beautiful")
local menubar = require("menubar")
require('general.const_variables')
require('general.error_handling')
require('utils.set_wallpaper')
require("awful.hotkeys_popup.keys")
beautiful.init(config_directory .. '/theme/theme.lua')
require('general.layouts_table')
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

require('Left_Bar')
require('Bindings')
require('general.rules')
require('clients.signals')

os.execute(config_directory .. "/autostart.sh")
