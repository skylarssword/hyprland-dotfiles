--  ██╗      ██████╗  █████╗ ██████╗ ███████╗██████╗
--  ██║     ██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
--  ██║     ██║   ██║███████║██║  ██║█████╗  ██████╔╝
--  ██║     ██║   ██║██╔══██║██║  ██║██╔══╝  ██╔══██╗
--  ███████╗╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║
--  ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
--
--  Entry point. All sources live here.
--  To switch a preset: change the require line and reload with SUPER+CTRL+R.

-- =====================
-- CORE
-- =====================
require("colors")   -- pywal/Material You palette — do not edit manually
require("core")     -- everything: monitor, env, input, gestures, appearance,
                    -- layouts, window rules, keybindings, autostart, plugins
require("monitors")

-- Workspace slide animation (verthori plugin)
hl.animation({ leaf = "workspaces", enabled = true, speed = 8, bezier = "smooth", style = "slidevert" })

-- Define Smooth Bezier
hl.curve("smooth", {
    type = "bezier",
    points = { {0.12, 1.0}, {0.22, 1.0} }
})

-- =====================
-- PRESETS — ANIMATIONS
-- =====================
-- Pick one. Comment out the rest.
   require("presets.animations.new-smooth")
-- require("presets.animations.new")
-- require("presets.animations.smooth")
-- require("presets.animations.smooth-pop")
-- require("presets.animations.classic")
-- require("presets.animations.standard")
-- require("presets.animations.dynamic")
-- require("presets.animations.high")
-- require("presets.animations.moving")
-- require("presets.animations.fast")
-- require("presets.animations.end4")
-- require("presets.animations.default")
-- require("presets.animations.disabled")



-- =====================
-- PRESETS — DECORATIONS
-- =====================
-- Uncomment to override the defaults in core.lua
-- require("presets.decorations.blur")
-- require("presets.decorations.no-blur")
-- require("presets.decorations.no-rounding")
-- require("presets.decorations.no-rounding-more-blur")
-- require("presets.decorations.rounding")
-- require("presets.decorations.rounding-all-blur")
-- require("presets.decorations.rounding-all-blur-no-shadows")
-- require("presets.decorations.rounding-more-blur")
-- require("presets.decorations.gamemode")

-- =====================
-- PRESETS — WINDOWS
-- =====================
-- Uncomment to override the defaults in core.lua
-- require("presets.windows.border-1")
-- require("presets.windows.border-1-reverse")
-- require("presets.windows.border-2")
-- require("presets.windows.border-2-reverse")
-- require("presets.windows.border-3")
-- require("presets.windows.border-3-reverse")
-- require("presets.windows.border-4")
-- require("presets.windows.border-4-reverse")
-- require("presets.windows.glass")
-- require("presets.windows.no-border")
-- require("presets.windows.no-border-more-gaps")
-- require("presets.windows.transparent")
-- require("presets.windows.gamemode")
