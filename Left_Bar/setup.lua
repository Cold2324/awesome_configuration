local widgets = require('widgets')
local awful = require('awful')
local gears = require('gears')

local function set_left_widgets(s, wibox)
  local system_menu = awful.menu({
    items = {
      { "  Quick Awesome", function() awesome.quit() end },
      { "  Reboot", 'systemctl reboot' },
      { " ⏻ Power Off", 'systemctl poweroff' }
    }
  })

  local system_launcher = awful.widget.launcher({
    image = config_directory .. '/assets/power_off.png',
    menu = system_menu
  })

  local left_widget = {
    system_launcher,
    {
      widget = wibox.container.margin,
      top = 5,
      bottom = 2
    },
    {
      {
        {
          s.mytaglist,
          direction = "west",
          widget = wibox.container.rotate
        },
        top = 10,
        bottom = 10,
        widget = wibox.container.margin
      },
      bg = '#282C34',
      widget = wibox.container.background,
      shape = gears.shape.rounded_rect
    },
    layout = wibox.layout.fixed.vertical,
  }
  return left_widget
end

local function set_right_widget(s, wibox)
  local right_widget = {
    layout = wibox.layout.fixed.vertical,
    -- systray
    {
      {
        widgets.systray(),
        top = 5,
        bottom = 5,
        widget = wibox.container.margin
      },
      bg = '#282C34',
      shape = gears.shape.rounded_rect,
      widget = wibox.container.background
    },
    {
      widget = wibox.container.margin,
      top = 5,
      bottom = 5
    },
    {
      {
        widgets.clock(),
        top = 12,
        bottom = 12,
        widget = wibox.container.margin
      },
      bg = '#282C34',
      widget = wibox.container.background,
      shape = gears.shape.rounded_rect
    },
    {
      widget = wibox.container.margin,
      top = 5,
      bottom = 5
    },
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
    -- spacing = 10,
    set_left_widgets(s, wibox),
    {
      layout = widgets.separator() -- Middle widget
    },
    set_right_widget(s, wibox)
  }
end

return setup_menu
