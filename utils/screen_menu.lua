local awful = require('awful')
local hotkeys_popup = require("awful.hotkeys_popup")

local awesome_menu = {
  { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "Manual", terminal .. " -e man awesome" },
  { "Edit config", editor_cmd .. " " .. awesome.conffile },
}

local programs_menu = {
  { "  Open terminal", terminal },
  { "  Browser", browser },
  { "  Files", files_manager },
  { "  Vscode", vscode }
}

local system_menu = {
  { "Latam keyboard", function() os.execute('setxkbmap latam') end },
  { "Us keyboard", function() os.execute('setxkbmap us') end }
}

screen_menu = awful.menu({
  items = {
    { "  Awesome", awesome_menu },
    { "  System", system_menu },
    { "  Programs", programs_menu },
  }
})

return screen_menu
