-- Hyprland Lua Configuration (Main Entry Point)
-- Modular structure with separate config files
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

-------------------------------
---- LOAD MODULAR CONFIGS ----
-------------------------------

require("lua.env")       -- Environment variables
require("lua.autostart") -- Autostart programs
require("lua.look")      -- Look and feel (decorations, animations)
require("lua.input")     -- Input configuration
require("lua.keybinds")  -- Keybindings
require("lua.rules")     -- Window and workspace rules
