local widgets = require('widgets')
local awful = require('awful')

local function set_left_widgets(s, wibox)
  local system_menu = awful.menu({
    items = {
      { "  Quick Awesome", function() awesome.quit() end},
      { "  Reboot", 'systemctl reboot'},
      { " ⏻ Power Off", 'systemctl poweroff'}
    }
  })
  
  local system_launcher = awful.widget.launcher({
    image = config_directory .. '/assets/power_off.png',
    menu = system_menu
  })
  
  local left_widget = {
    system_launcher,
    {
      s.mytaglist,
      direction = "west",
      widget = wibox.container.rotate
    },
    layout = wibox.layout.fixed.vertical,
  }
  return left_widget
end

local function set_right_widget(s, wibox)
  local battery = {
    widgets.battery {
      ac_prefix = '',
      widget_font = 'Hack 12',
      battery_prefix = ''
    },
    direction = "east",
    widget = wibox.container.rotate
  }

  local right_widget = {
    layout = wibox.layout.fixed.vertical,
    widgets.keyboard(),
    widgets.pipe_sep(),
    widgets.systray(),
    widgets.pipe_sep(),
    widgets.clock(),
    widgets.pipe_sep(),
    battery,
    widgets.pipe_sep(),
    {
      s.mylayoutbox,
      direction = "west",
      widget = wibox.container.rotate
    },
  }
  return right_widget
end

function setup_menu(s, wibox)
  -- Add widgets to the wibox
  s.mywibox:setup {
      layout = wibox.layout.align.vertical,
      set_left_widgets(s, wibox),
      {
        layout = widgets.separator() -- Middle widget
      },
      set_right_widget(s, wibox)
  }
end

return setup_menu