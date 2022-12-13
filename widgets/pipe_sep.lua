local wibox = require('wibox')

function set_pipe_sep()
  local pipe_sep = wibox.container.rotate(wibox.widget.textbox(' | '), 'east')
  return pipe_sep
end

return set_pipe_sep