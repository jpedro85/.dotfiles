-- Input Configuration
-- See https://wiki.hypr.land/Configuring/Variables/#input

hl.config({
    input = {
        -- pt = default (typing), us = ANSI/English. Toggle with ALT + SPACE
        -- (hl.dsp.exec_cmd of hypr/scripts/kb-layout-toggle.sh, see keybinds.lua).
        kb_layout  = "pt,us",
        kb_variant = "",
        -- Physical board is an Iqunix EV63 (ANSI, no ISO key) -> pc104, not pc105.
        kb_model   = "pc104",
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
