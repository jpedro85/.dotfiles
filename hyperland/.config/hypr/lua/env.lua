-- Environment Variables Configuration
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
