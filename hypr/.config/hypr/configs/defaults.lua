--##################
--## MY PROGRAMS ###
--##################
-- See https://wiki.hypr.land/Configuring/Keywords/
-- Set the path to the wallpaper
local wallpaper = os.getenv("HOME") .. "/Pictures/wallpapers/spiderverse.jpeg"
-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local picker = "hyprpicker -a"
local browser = "firefox"
local lockscreen = "hyprlock"
local pomodoro = "pilorama"
local notificationMenu = "swaync-client -t -sw"
local logoutMenu = "wlogout"

return {
    wallpaper = wallpaper,
    terminal = terminal,
    fileManager = fileManager,
    menu = menu,
    picker = picker,
    browser = browser,
    lockscreen = lockscreen,
    pomodoro = pomodoro,
    notificationMenu = notificationMenu,
    logoutMenu = logoutMenu,
}
