-- Hyprland Lua Configuration
-- Migrated from hyprlang format
-- See https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "alacritty"
local fileManager  = "nemo"
local menu         = "rofi -show drun"
local browser      = "librewolf"
local discord      = "vesktop"
local email        = "thunderbird"
local spotify      = "spotify-launcher"

-------------------
---- AUTOSTART ----
-------------------

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
    hl.exec_cmd(browser)
    hl.exec_cmd(discord)
    hl.exec_cmd(email)
    hl.exec_cmd(spotify)
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Scripts directory
hl.env("ARCH_SCRIPTS_DIR", os.getenv("HOME") .. "/.dotfiles/arch-scripts/.local/bin")

-- Cursor settings
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "NightDiamond")
hl.env("HYPRCURSOR_THEME", "NightDiamond")
hl.env("HYPRCURSOR_SIZE", "24")

-- Electron and Qt settings
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QUICK_CONTROLS_STYLE", "org.hyprland.style")

-- Hardware acceleration settings (AMD)
hl.env("LIBVA_DRIVER_NAME", "radeonsi")
hl.env("__GL_VRR_ALLOWED", "0")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border   = "rgb(cba6f7)",
            inactive_border = "rgb(1a1a1a)",
        },

        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = true,

        layout = "dwindle",
    },

    decoration = {
        rounding = 10,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled  = false,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows",     enabled = true, speed = 3.5, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3.5, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 5,   bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 3.5, bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,   bezier = "default" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        disable_hyprland_logo   = true,
        disable_splash_rendering = true,
    },

    opengl = {
        nvidia_anti_flicker = false,
    },

    cursor = {
        no_hardware_cursors = 1,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "pt",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 2,

        sensitivity   = 0, -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "flat",

        touchpad = {
            natural_scroll = false,
        },
    },
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
local primaryMonitor   = "HDMI-A-1"
local secondaryMonitor = "eDP-1"

hl.workspace_rule({ workspace = "1", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "2", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "3", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "4", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "5", monitor = primaryMonitor })

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local mainMod = "ALT"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Move window with mainMod + SHIFT + hjkl keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Move focus with mainMod + hjkl keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Audio control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5 && notify-send -h int:value:\"$(pamixer --get-volume)\" -i ~/.config/dunst/assets/volume.svg -t 500 -r 2593 \"Volume: $(pamixer --get-volume) %\""), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5 && notify-send -h int:value:\"$(pamixer --get-volume)\" -i ~/.config/dunst/assets/volume.svg -t 500 -r 2593 \"Volume: $(pamixer --get-volume) %\""), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t && notify-send -i ~/.config/dunst/assets/$(pamixer --get-mute | grep -q \"true\" && echo \"volume-mute.svg\" || echo \"volume.svg\") -t 500 -r 2593 \"Toggle Mute\""), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true })

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("sh -c '~/.config/hypr/scripts/screenshot.sh'"))

-- Lock the Screen
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("hyprlock"))

-- Move/resize windows with mainMod + LMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    -- Ignore maximize requests from all apps.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "librewolf-workspace",
    match = { class = "^(librewolf)$" },
    workspace = "1",
})

hl.window_rule({
    name  = "vesktop-workspace",
    match = { class = "^(vesktop)$" },
    workspace = "2",
})

hl.window_rule({
    name  = "spotify-workspace",
    match = { class = "^(Spotify)$" },
    workspace = "4",
})

hl.window_rule({
    name  = "thunderbird-workspace",
    match = { class = "^(org.mozilla.Thunderbird)$" },
    workspace = "5",
})

hl.window_rule({
    name  = "no-focus-jetbrains",
    match = { class = "^(jetbrains-.*)$", float = true, title = "^win\\d+$" },
    no_focus = true,
})

hl.window_rule({
    name  = "cs2-immediate",
    match = { class = "cs2" },
    immediate = true,
})
