-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
local globalVariables = require('Trist4nConfig/GlobalVariables')

hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("awww-daemon & hypridle")
    hl.exec_cmd("zen-browser", { workspace = "1" })
    hl.exec_cmd("pear-desktop", { workspace = "4" })
end)
