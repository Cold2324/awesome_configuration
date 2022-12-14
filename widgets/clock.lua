local wibox = require('wibox')
function set_clock()
  local clock = wibox.widget {
    format = '%H %M',
    align = 'center',
    font = 'Hack Bold 16',
    widget = wibox.widget.textclock
  }
  return clock
end

return set_clock