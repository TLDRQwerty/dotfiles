local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/catppuccin/"

theme.rosewater = "#f5e0dc"
theme.flamingo = "#f2cdcd"
theme.pink = "#f5c2e7"
theme.mauve = "#cba6f7"
theme.red = "#f38ba8"
theme.maroon = "#eba0ac"
theme.peach = "#fab387"
theme.yellow = "#f9e2af"
theme.green = "#a6e3a1"
theme.teal = "#94e2d5"
theme.sky = "#89dceb"
theme.sapphire = "#74c7ec"
theme.blue = "#89b4fa"
theme.lavender = "#b4befea"
theme.text = "#cdd6f4"
theme.subtext1 = "#bac2de"
theme.subtext0 = "#a6adc8"
theme.overlay2 = "#9399b2"
theme.overlay1 = "#7f849c"
theme.overlay0 = "#6c7086"
theme.surface2 = "#585b70"
theme.surface1 = "#45475a"
theme.surface0 = "#313244"
theme.base = "#1e1e2e"
theme.mantle = "#181825"
theme.crust = "#11111b"

theme.pink = "#f5c2e7"

theme.font = "undefined medium 8"

theme.bg_normal = theme.base
theme.bg_focus = theme.base
theme.bg_urgent = theme.red
theme.bg_minimize = theme.crust
theme.bg_systray = theme.bg_normal

theme.fg_normal = theme.text
theme.fg_focus = theme.mauve
theme.fg_urgent = theme.text
theme.fg_minimize = theme.subtext0

theme.useless_gap = dpi(0)
theme.border_width = dpi(1)
theme.border_normal = theme.base
theme.border_focus = theme.mauve
theme.border_marked = theme.mauve

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme.dir .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.dir .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = theme.dir .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.dir .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.dir .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.dir .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.dir .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.dir .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "titlebar/maximized_focus_active.png"

-- get random file in directory
local function get_random_file(dir)
    local files = {}
    for file in io.popen('ls -1 "' .. dir .. '"'):lines() do
        table.insert(files, file)
    end
    return files[math.random(#files)]
end

local wallpaper_path = string.format("%s/.wallpapers/ArtOfHaloInfinite4K/", os.getenv("HOME"))
local wallpaper_file = get_random_file(wallpaper_path)
theme.wallpaper = string.format("%s%s", wallpaper_path, wallpaper_file)

-- You can use your own layout icons like this:
theme.layout_fairh = theme.dir .. "layouts/fairhw.png"
theme.layout_fairv = theme.dir .. "layouts/fairvw.png"
theme.layout_floating = theme.dir .. "layouts/floatingw.png"
theme.layout_magnifier = theme.dir .. "layouts/magnifierw.png"
theme.layout_max = theme.dir .. "layouts/maxw.png"
theme.layout_fullscreen = theme.dir .. "layouts/fullscreenw.png"
theme.layout_tilebottom = theme.dir .. "layouts/tilebottomw.png"
theme.layout_tileleft = theme.dir .. "layouts/tileleftw.png"
theme.layout_tile = theme.dir .. "layouts/tilew.png"
theme.layout_tiletop = theme.dir .. "layouts/tiletopw.png"
theme.layout_spiral = theme.dir .. "layouts/spiralw.png"
theme.layout_dwindle = theme.dir .. "layouts/dwindlew.png"
theme.layout_cornernw = theme.dir .. "layouts/cornernww.png"
theme.layout_cornerne = theme.dir .. "layouts/cornernew.png"
theme.layout_cornersw = theme.dir .. "layouts/cornersww.png"
theme.layout_cornerse = theme.dir .. "layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/candy-icons/"

return theme
