local function set_left_widgets(s, wibox)
  local left_widget = {
    --mylauncher,
    {
      s.mytaglist,
      direction = "west",
      widget = wibox.container.rotate
    },
    layout = wibox.layout.fixed.vertical,
      --s.mypromptbox,
  }
  return left_widget
end

local function set_right_widget(s, wibox)
  local right_widget = {
    layout = wibox.layout.fixed.vertical,
    {
      mykeyboardlayout,
      direction = "east",
      widget = wibox.container.rotate
    },
    {
      textbox(" | "),
      direction = "east",
      widget = wibox.container.rotate
    },
    {
      wibox.widget.systray(),
      direction = "west",
      widget = wibox.container.rotate
    },
    {
      textbox(" | "),
      direction = "east",
      widget = wibox.container.rotate
    },
    {
      mytextclock,
      direction = "east",
      widget = wibox.container.rotate
    },
    {
      textbox(" | "),
      direction = "east",
      widget = wibox.container.rotate
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
      set_left_widgets(s, wibox),
      {
        layout = separator -- Middle widget
      },
      set_right_widget(s, wibox)
  }
end
