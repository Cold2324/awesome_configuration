local wibox = require('wibox')

function set_systray()
  local systray = wibox.container.rotate(wibox.widget.systray(), 'west')
  return systray
end

return set_systray
