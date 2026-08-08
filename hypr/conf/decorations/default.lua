-- -----------------------------------------------------
-- General window decoration
-- name: "Default"
-- -----------------------------------------------------

hl.config({
    decoration = {
        rounding = 20,
        active_opacity = 0.6,
        inactive_opacity = 0.6,
        fullscreen_opacity = 1.0,
        rounding_power = 3,

        shadow = {
            enabled = true,
            range = 30,
            render_power = 3,
            color = "rgba(00000080)",
        },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 4,
            new_optimizations = on,
            ignore_opacity = true,
            xray = false,
            vibrancy = 0.0696,
	  --  noise = 0.06,
--	   brightness = 1.1,
        },

--  vibrance shader here comment to disable:
      --  screen_shader = os.getenv("HOME") .. "/.config/hypr/shaders/vibrance.frag",
      screen_shader = os.getenv("HOME") .. "/.config/hypr/shaders/oled-vibrance.frag",
    },
})
