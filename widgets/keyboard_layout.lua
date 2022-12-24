local awful = require('awful')
local wibox = require('wibox')

function show_keyboard_layout()
  local keyboard_layout = wibox.container.rotate(awful.widget.keyboardlayout(), 'east')
  return keyboard_layout
end

return show_keyboard_layout
