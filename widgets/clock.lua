local wibox = require('wibox')

function set_clock()
  local clock = wibox.container.rotate(wibox.widget {
      {
        widget = wibox.widget.textclock,
        format = "%H:",
      },
      {
        widget = wibox.widget.textclock,
        format = "%M",
      },
      layout = wibox.layout.fixed.horizontal,
      spacing = 3
    },
    'east'
  )
  return clock
end

return set_clock