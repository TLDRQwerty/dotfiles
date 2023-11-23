local watch = require("awful.widget.watch")
local beautiful = require("beautiful")
local  helpers = require("widgets.helpers")

local CMD = [[sh -c "LANGUAGE=en_US.UTF-8 free"]]

local memwidget = {}

local function worker(_args)
  local args = _args or {}

  local width = args.width or 100
  local color = args.color or beautiful.fg_normal
  local bg_color = args.bg_color or beautiful.bg_normal

  local timeout = args.timeout or 1

  memwidget.widget = helpers.create_textbox({
    text = "MEM: ",
    width = width,
    color = color,
    bg_color = bg_color,
  })

  watch(CMD, timeout, function(widget, stdout)
    local total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap =
    stdout:match('(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*Swap:%s*(%d+)%s*(%d+)%s*(%d+)')

    local u = helpers.getpercent(used + used_swap, total+total_swap)
    widget:set_value(u)
  end,
    memwidget.widget)
  return memwidget.widget
end

return setmetatable(memwidget, {
  __call = function(_, ...)
    return worker(...)
  end,
})
