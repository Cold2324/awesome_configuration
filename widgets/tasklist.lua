local awful = require('awful')

function create_tasklist(s, tasklist_buttons)
  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  } 
end

return create_tasklist