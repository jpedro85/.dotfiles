-- Window and Workspace Rules Configuration
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Workspace to monitor binding
local primaryMonitor   = "HDMI-A-1"
local secondaryMonitor = "eDP-1"

hl.workspace_rule({ workspace = "1", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "2", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "3", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "4", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "5", monitor = primaryMonitor })

-- Window rules
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
