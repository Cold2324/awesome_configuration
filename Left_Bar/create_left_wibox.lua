local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local setup = require('Left_Bar.setup')

create_border_radius = function (cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 12)
end

function create_left_wibox(s)
    -- Create the wibox
    s.mywibox = awful.wibar({
      position = "left",
      screen = s,
      bg = "#1D2025",
      width = 37,
      height = 720,
      border_color = "#1D2025",
      border_width = 10,
      shape = create_border_radius
    })

    -- Wibar Placement
    awful.placement.left(s.mywibox, {margins = {left = 8, right = 14, top = 10, bottom = 10}})

    setup(s, wibox)
end

return create_left_wibox