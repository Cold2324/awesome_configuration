local awful = require('awful')
local wibox = require('wibox')
local setup = require('Left_Bar.setup')

function create_left_wibox(s)
    -- Create the wibox
    s.mywibox = awful.wibar({
      position = "left",
      screen = s,
      bg = "#1D2025",
      width = 30,
      height = 720,
      border_color = "#1D2025",
      border_width = 10,
      shape = newshape
    })

    -- Wibar Placement
    awful.placement.left(s.mywibox, {margins = {left = 8, right = 14, top = 10, bottom = 10}})

    setup(s, wibox)
end

return create_left_wibox