local gears = require('gears')
local awful = require('awful')
local Key = require('awful.key')
local hotkeys_popup = require("awful.hotkeys_popup")

local Volume_Control = {
    Key({}, "XF86AudioRaiseVolume", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end,
        { description = "raise volume" }),
    Key({}, "XF86AudioLowerVolume", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end,
        { description = "lower volume" }),
    Key({}, "XF86AudioMute", function() awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end,
        { description = "mute volume" }),
}

local Brightness_Control = {
    Key({}, "XF86MonBrightnessUp", function() awful.spawn("lux -a 10%") end, { description = "raise brightness" }),
    Key({}, "XF86MonBrightnessDown", function() awful.spawn("lux -s 10%") end, { description = "lower brightness" }),
}

globalkeys = gears.table.join(
    Key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
    Key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
    Key(
        { modkey }, "j",
        function()
            awful.client.focus.byidx(1)
        end,
        { description = "focus next by index", group = "client" }
    ),
    Key({ modkey }, "k",
        function()
            awful.client.focus.byidx(-1)
        end,
        { description = "focus previous by index", group = "client" }
    ),
    Key({ modkey }, "w", function() screen_menu:show() end,
        { description = "show main menu", group = "awesome" }),

    -- Layout manipulation
    Key(
        { modkey, "Shift" },
        "j",
        function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }
    ),
    Key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }),
    Key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    Key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    Key({ modkey, }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),
    Key({ modkey, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),

    -- Standard program
    Key({ modkey, }, "Return", function() awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }),
    Key({ modkey, "Shift" }, "s", function() awful.spawn("rofi -show drun") end,
        { description = "open rofi launcher", group = "launcher" }),

    Volume_Control[1],
    Volume_Control[2],
    Volume_Control[3],
    Brightness_Control[1],
    Brightness_Control[2],

    Key({ modkey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    Key({ modkey, "Shift" }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" }),

    Key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout" }),
    Key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = "layout" }),
    Key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
        { description = "increase the number of master clients", group = "layout" }),
    Key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = "layout" }),
    Key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),
    Key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),
    Key({ modkey, }, "space", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    Key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    Key(
        { modkey, "Control" },
        "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "restore minimized", group = "client" }
    )

-- -- Prompt
-- Key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
--           {description = "run prompt", group = "launcher"}),

-- Key({ modkey }, "x",
--           function ()
--               awful.prompt.run {
--                 prompt       = "Run Lua code: ",
--                 textbox      = awful.screen.focused().mypromptbox.widget,
--                 exe_callback = awful.util.eval,
--                 history_path = awful.util.get_cache_dir() .. "/history_eval"
--               }
--           end,
--           {description = "lua execute prompt", group = "awesome"}),
-- Menubar
-- Key({ modkey }, "p", function() menubar.show() end,
--           {description = "show the menubar", group = "launcher"})
)
