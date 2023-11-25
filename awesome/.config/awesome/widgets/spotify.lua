local watch = require("awful.widget.watch")
local beautiful = require("beautiful")
local helpers = require("widgets.helpers")

local CMD = [[sh -c "playerctl metadata --format '{{ artist }} - {{ title }}'"]]

local spotifywidget = {}

local function worker(_args)
	local args = _args or {}

	local width = args.width or 200
	local color = args.color or beautiful.fg_normal
	local bg_color = args.bg_color or beautiful.bg_normal

	local timeout = args.timeout or 1

	spotifywidget.widget = helpers.create_textbox({
		text = "",
		width = width,
		color = color,
		bg_color = bg_color,
	})

	watch(CMD, timeout, function(widget, stdout)
		local u = stdout:match("(%w.+)")
		widget:set_value(u)
	end, spotifywidget.widget)

	return spotifywidget.widget
end

return setmetatable({}, {
	__call = function(_, ...)
		return worker(...)
	end,
})
