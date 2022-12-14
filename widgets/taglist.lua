local gears = require('gears')
local awful = require('awful')

function create_taglist(s, taglist_buttons)
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
    style = {
      shape = gears.shape.rounded_bar,
      bg_focus = "#1D2025",
      fg_focus = "#BE5046",
      font = "JetBrains 30",
      fg_occupied = "#61AFEF"
    },
  }
end

return create_taglist