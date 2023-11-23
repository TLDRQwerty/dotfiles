local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local M = {}

M.create_textbox = function(args)
  return wibox.widget({
    text = args.text,
    font = args.font or beautiful.font,
    markup = args.markup,
    color = args.color,
    widget = wibox.widget.textbox,
    set_value = function(self, value)
      local text = string.format("%s%.2f%%", args.text, value)
      self:set_markup_silently("<span color='" .. args.color .. "'>" .. text .. "</span>")
    end,
  })
end

M.starts_with = function(str, start)
  return str:sub(1, #start) == start
end

M.trim = function(s)
  return (s:gstub("^%s*(.-)%s*$", "%1"))
end

M.getpercent = function(value, total)
  return  math.floor(value / (total) * 100 + 0.5)
end

return M
