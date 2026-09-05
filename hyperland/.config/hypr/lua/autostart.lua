-- Autostart Configuration
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function ()
    -- Set wallpaper and cursor theme
    hl.exec_cmd("hyprpaper")

    -- Start status bar
    hl.exec_cmd("waybar")

    -- Disabled for now as I don't use it
    -- Might change to turn off monitor for when I use hyprlock
    -- hl.exec_cmd("hypridle")

    -- Network management and notifications
    hl.exec_cmd("dunst -conf .config/dunst/dunstrc")

    -- Environment setup for Wayland
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Hyprland polkit agent
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Start browser, discord, email client and spotify
    local browser = "librewolf"
    local discord = "vesktop"
    local email = "thunderbird"
    local spotify = "spotify-launcher"

    hl.exec_cmd(browser)
    -- Delay Vesktop launch to let waybar/system tray initialize properly
    hl.timer(function()
        hl.exec_cmd(discord)
    end, { timeout = 1500, type = "oneshot" })
    hl.exec_cmd(email)
    hl.exec_cmd(spotify)
end)
