local wibox = require('wibox')

function set_separator()
  local sep = wibox.widget.separator({ visible = false })
  return sep
end

return set_separator
