local watch = require("awful.widget.watch")
local beautiful = require("beautiful")
local helpers = require("widgets.helpers")

local CMD = [[sh -c "wpctl get-volume @DEFAULT_AUDIO_SINK@"]]

local volumewidget = {}

local function worker(_args)
	local args = _args or {}

	local width = args.width or 400
	local color = args.color or beautiful.fg_normal
	local bg_color = args.bg_color or beautiful.bg_normal

	local timeout = args.timeout or 1

	volumewidget.widget = helpers.create_textbox({
		text = "Vol: ",
		width = width,
		color = color,
		bg_color = bg_color,
	})
	watch(CMD, timeout, function(widget, stdout)
		local u = stdout:match("(%d.+)")
		widget:set_value(u)
	end, volumewidget.widget)

	return volumewidget.widget
end

return setmetatable({}, {
	__call = function(_, ...)
		return worker(...)
	end,
})
