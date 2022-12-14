local gears = require('gears')
local awful = require('awful')

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button(
      { modkey },
      1,
      function(t)
          if client.focus then
              client.focus:move_to_tag(t)
          end
      end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button(
      { modkey },
      3,
      function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
      end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

function create_taglist(s)
  -- Each screen has its own tag table.
  awful.tag({ "", "", "", "", "" }, s, awful.layout.layouts[1])

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