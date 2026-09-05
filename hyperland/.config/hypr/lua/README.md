# Hyprland Lua Configuration Modules

This directory contains modularized Lua configuration files for Hyprland. Each file handles a specific aspect of the configuration.

## Structure

```
~/.config/hypr/
├── hyprland.lua ............. Main entry point (loads all modules)
└── lua/
    ├── README.md ............ This file
    ├── env.lua .............. Environment variables
    ├── autostart.lua ........ Startup programs and commands
    ├── look.lua ............. Visual settings (gaps, borders, animations)
    ├── input.lua ............ Keyboard and input configuration
    ├── keybinds.lua ......... All keybindings
    └── rules.lua ............ Window and workspace rules
```

## Module Overview

### `env.lua`
**Environment Variables** - Settings for cursor, fonts, hardware acceleration, etc.

Contains:
- Cursor theme and size
- Qt and Electron configuration
- Hardware acceleration settings (AMD GPU)
- Custom environment paths

### `autostart.lua`
**Startup Programs** - Commands executed when Hyprland starts

Contains:
- Wallpaper and status bar (`hyprpaper`, `waybar`)
- Notification daemon (`dunst`)
- System utilities (polkit agent, dbus)
- Application launchers (browser, Discord, email, Spotify)

### `look.lua`
**Visual Configuration** - Decorations, gaps, animations, and layout settings

Contains:
- General: gaps, borders, tearing
- Decoration: rounding, shadows, blur, opacity
- Animations: curves and animation definitions
- Layouts: Dwindle and Master configuration
- Misc: display options, cursor behavior

### `input.lua`
**Input Configuration** - Keyboard and mouse settings

Contains:
- Keyboard layout (Portuguese)
- Mouse acceleration profile
- Touchpad settings
- Sensitivity and repeat settings

### `keybinds.lua`
**Keybindings** - All keyboard shortcuts (39 binds)

Contains:
- Window management (focus, move, float, fullscreen)
- Workspace switching
- Program launchers
- Audio controls (volume, media)
- Screenshot and lock

### `rules.lua`
**Window and Workspace Rules** - Per-app and per-workspace configuration

Contains:
- Workspace to monitor assignments
- App-specific workspace assignments (browser, Discord, Spotify, email)
- Window focus and visibility rules
- Special app behaviors (JetBrains, CS2)

## Adding New Configuration

### Option 1: Add to Existing Module
Edit the appropriate module file and reload:

```bash
hyprctl reload
```

### Option 2: Create a New Module
1. Create a new file in `lua/` (e.g., `lua/custom.lua`)
2. Add your configuration using `hl.*` functions
3. Add `require("lua.custom")` to `hyprland.lua`
4. Reload: `hyprctl reload`

Example:

```lua
-- lua/custom.lua
hl.env("MY_VAR", "value")
hl.bind("SUPER + T", hl.dsp.exec_cmd("my-command"))
```

Then in `hyprland.lua`:
```lua
require("lua.custom")
```

## Editing Notes

### Variable Scope
Variables defined in one module are **local** to that module. If you need to share values between modules:

**Option 1:** Redefine in each module
```lua
-- In keybinds.lua
local terminal = "alacritty"
hl.bind("ALT + Return", hl.dsp.exec_cmd(terminal))

-- In autostart.lua  
local terminal = "alacritty"
hl.exec_cmd(terminal)
```

**Option 2:** Use a shared config file
```lua
-- lua/programs.lua
return {
    terminal = "alacritty",
    browser = "librewolf",
}

-- In keybinds.lua
local programs = require("lua.programs")
hl.bind("ALT + Return", hl.dsp.exec_cmd(programs.terminal))
```

### Reload Changes
After editing any module:
```bash
hyprctl reload
```

Check logs for errors:
```bash
hyprctl dumplog
```

## Troubleshooting

### Syntax Error
```bash
luac5.4 -p lua/myfile.lua
```

### Module Not Loading
- Check `require()` path in `hyprland.lua` matches actual filename
- Verify no circular dependencies between modules
- Check logs: `hyprctl dumplog | grep -i error`

### Configuration Not Applying
- Verify file has been saved
- Check `hyprctl reload` returns `ok`
- Look for Lua syntax errors in logs
- Ensure no naming conflicts with built-in `hl.*` functions

## Performance

Modular loading has minimal performance impact. All modules are loaded at startup and compiled into memory, so subsequent reloads are fast.

## Migration from Monolithic File

If you had a single `hyprland.lua` file:

1. Copy the monolithic file for reference:
   ```bash
   cp hyprland.lua hyprland.lua.backup
   ```

2. Extract sections into separate modules (see examples in each file)

3. Update main `hyprland.lua` to load modules:
   ```lua
   require("lua.env")
   require("lua.autostart")
   -- etc.
   ```

4. Test:
   ```bash
   hyprctl reload
   ```

## Resources

- [Hyprland Wiki - Configuring](https://wiki.hypr.land/Configuring/Start/)
- [Hyprland Lua API Stubs](file:///usr/share/hypr/stubs/hl.meta.lua)
- [Hyprland GitHub Examples](https://github.com/hyprwm/Hyprland/tree/main/example)
