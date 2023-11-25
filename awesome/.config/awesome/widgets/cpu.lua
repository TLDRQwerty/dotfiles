local watch = require("awful.widget.watch")
local beautiful = require("beautiful")
local helpers = require("widgets.helpers")

local CMD = [[grep --max-count=1 '^cpu.' /proc/stat]]

local cpuwidget = {}

local function worker(_args)
  local args = _args or {}

  local width = args.width or 100
  local color = args.color or beautiful.fg_normal
  local bg_color = args.bg_color or beautiful.bg_normal

  local timeout = args.timeout or 1

  cpuwidget.widget = helpers.create_textbox({
    text = "CPU: ",
    width = width,
    color = color,
    bg_color = bg_color,
  })

  local maincpu = {}
  watch(CMD, timeout, function(widget, stdout)
    local _, user, nice, system, idle, iowait, irq, softirq, steal, _, _ =
        stdout:match("(%w+)%s+(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)")

    local total = user + nice + system + idle + iowait + irq + softirq + steal

    local diff_idle = idle - tonumber(maincpu["idle_prev"] == nil and 0 or maincpu["idle_prev"])
    local diff_total = total - tonumber(maincpu["total_prev"] == nil and 0 or maincpu["total_prev"])
    local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

    maincpu["total_prev"] = total
    maincpu["idle_prev"] = idle

    widget:set_value(diff_usage)
  end, cpuwidget.widget)

  return cpuwidget.widget
end

return setmetatable({}, {
  __call = function(_, ...)
    return worker(...)
  end,
})
