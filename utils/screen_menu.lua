local awful = require('awful')
local hotkeys_popup = require("awful.hotkeys_popup")

awesome_menu = {
  { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "Manual", terminal .. " -e man awesome" },
  { "Edit config", editor_cmd .. " " .. awesome.conffile }
}

screen_menu = awful.menu({
 items = {
   { "  Awesome", awesome_menu },
   { "  Open terminal", terminal },
   { "  Browser", browser},
   { "  Files", files_manager},
 }
})

return screen_menu