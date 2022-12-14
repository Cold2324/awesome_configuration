-- original repo: https://github.com/c0dingcl0wn/awesome-wm-widgets

local wibox = require("wibox")
local watch = require("awful.widget.watch")

wifi_widget = wibox.widget.textbox()
watch(
    "iw dev wlp2s0 link", 1,
    function(widget, stdout, stderr, exitreason, exitcode)
    local wifi = string.match(stdout, "SSID:.*\n")
    local index_1, index_2 = string.find(stdout, "SSID: [^\n]*")
    local wifi_signal = string.match(stdout, "signal:.*\n")
    local index_3, index_4 = string.find(stdout, "signal: [^\n]*")
    local index_5, index_6 = string.find(stdout, "tx bitrate:%s%d+%p+%d+%s%a+%p%a")
    if(wifi == '' or wifi==nil ) then
        widget.text= "No wifi"
    else
        wifi= string.sub(stdout, index_1+6, index_2)
        wifi_signal= string.sub(stdout, index_3+8, index_4-1)
        wifi_bitrate= string.sub(stdout, index_5+12, index_6)
        widget.text=wifi .. ", " .. wifi_signal .. ", " .. wifi_bitrate
    end
end,
wifi_widget
)

wifi_widget_rotate = wibox.container.rotate(wifi_widget, 'east')

return wifi_widget_rotate