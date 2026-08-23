# Hyprland Configuration Migration Guide

## From Hyprlang to Lua

This document outlines the migration of your Hyprland configuration from the old hyprlang format to the new Lua format.

### Overview

Your configuration has been migrated to a single `hyprland.lua` file. The old `.conf` files are preserved as backups for reference.

### Key Changes

#### 1. **Comments**
- **Old**: `# This is a comment`
- **New**: `-- This is a comment`

#### 2. **Environment Variables**
- **Old**: `env = VARIABLE_NAME,value`
- **New**: `hl.env("VARIABLE_NAME", "value")`

Example:
```lua
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "NightDiamond")
```

#### 3. **Monitor Configuration**
- **Old**: `monitor=,preferred,auto,1`
- **New**: 
```lua
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})
```

#### 4. **Configuration Blocks**
- **Old**:
```conf
general {
    gaps_in = 5
    gaps_out = 5
}
```
- **New**:
```lua
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
    },
})
```

#### 5. **Keybindings**
- **Old**: `bind = $mainMod, Return, exec, $terminal`
- **New**: `hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))`

Key differences:
- Use `+` to separate key modifiers and keys (e.g., `ALT + H`)
- Use dispatcher functions like `hl.dsp.exec_cmd()`, `hl.dsp.window.close()`, etc.
- Keybind options go in a third parameter table

#### 6. **Workspace Configuration**
- **Old**: `workspace = 1, $primaryMonitor`
- **New**:
```lua
hl.workspace({
    id = 1,
    monitor = primary_monitor,
})
```

#### 7. **Autostart Commands**
- **Old**: `exec-once = hyprpaper`
- **New**: `hl.exec_once("hyprpaper")`

#### 8. **Window and Workspace Rules**
- **Old**: `windowrule = suppress_event maximize, match:class .*`
- **New**: `hl.windowrule("suppress_event maximize", "match:class .*")`

### Dispatcher Functions Reference

Common dispatcher patterns in the new Lua config:

```lua
-- Execute commands
hl.dsp.exec_cmd("command")

-- Window operations
hl.dsp.window.close()
hl.dsp.window.toggle_floating()
hl.dsp.window.toggle_fullscreen()
hl.dsp.window.move({ direction = "left" })
hl.dsp.window.move_to_workspace({ id = 1 })

-- Layout operations
hl.dsp.layout.toggle_split()

-- Workspace operations
hl.dsp.workspace.switch({ id = 1 })

-- Focus operations
hl.dsp.focus({ direction = "left" })

-- Exit
hl.dsp.exit()
```

### File Structure

**Old Structure** (Modular config files):
```
hyprland.conf
configs/
  ├── hyprland-env.conf
  ├── hyprland-look.conf
  ├── hyprland-startup.conf
  ├── hyprland-input.conf
  ├── hyprland-keybinds.conf
  └── hyprland-rules.conf
```

**New Structure** (Single file, but can be modularized):
```
hyprland.lua
```

### How to Use

1. **Test the new configuration**:
   ```bash
   hyprctl reload
   ```

2. **If you encounter issues**, check the Hyprland logs:
   ```bash
   hyprctl dumplog
   ```

3. **Revert if needed**: The old `.conf` files are still present if you need to roll back:
   - Rename `hyprland.lua` to `hyprland.lua.backup`
   - Rename `hyprland.conf` back if it exists
   - Restart Hyprland

### Advanced: Modularizing the Lua Config

If you prefer to keep your config modular (like the old structure), you can use Lua's `require()`:

**hyprland.lua**:
```lua
require("config.env")
require("config.look")
require("config.input")
require("config.keybinds")
require("config.rules")
```

Then create separate files in `~/.config/hypr/lua/config/` for each section.

### Known Limitations

- Some advanced dispatcher functions may need to be discovered from the official example config
- Mouse bindings syntax may differ from your previous setup
- Some window rule syntax may have changed

### Resources

- [Official Hyprland Wiki - Configuring](https://wiki.hyprland.org/Configuring/Start/)
- [Official Example Config](https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.lua)
- [Hyprland Keybinds Documentation](https://wiki.hyprland.org/Configuring/Binds/)

### Next Steps

1. Test the configuration with `hyprctl reload`
2. Check for any warnings or errors in the Hyprland log
3. Fine-tune any keybindings or settings as needed
4. Consider archiving the old `.conf` files once you're confident in the new setup

### Configuration Mapping

| Feature | Old File | New Location |
|---------|----------|--------------|
| Monitors | hyprland.conf | `hl.monitor()` |
| Environment | hyprland-env.conf | `hl.env()` |
| Look & Feel | hyprland-look.conf | `hl.config({ general = {...}, decoration = {...} })` |
| Input | hyprland-input.conf | `hl.config({ input = {...} })` |
| Keybinds | hyprland-keybinds.conf | `hl.bind()` |
| Window Rules | hyprland-rules.conf | `hl.windowrule()` |
| Autostart | hyprland-startup.conf | `hl.exec_once()` |
| Workspaces | hyprland.conf | `hl.workspace()` |
