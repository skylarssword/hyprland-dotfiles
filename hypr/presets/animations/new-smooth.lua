-- -----------------------------------------------------
-- Animations
-- New Smooth
-- Extra Smooth / Buttery
-- -----------------------------------------------------

hl.config({
    animations = {
        enabled = true,
    }
})

--------------------------------------------------------------------------------
-- Curves
--------------------------------------------------------------------------------

hl.curve("smooth", {
    type = "bezier",
    points = { {0.12, 1.0}, {0.22, 1.0} }
})

hl.curve("move", {
    type = "bezier",
    points = { {0.10, 0.98}, {0.20, 1.0} }
})

hl.curve("liner", { type = "bezier", points = { {1, 1}, {1, 1} } })

--------------------------------------------------------------------------------
-- Rules
--------------------------------------------------------------------------------

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    bezier = "smooth",
    style = "popin 75%"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 6,
    bezier = "smooth",
    style = "popin 75%"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "smooth",
    style = "popin 75%"
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 9,
    bezier = "move",
    style = "slide"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 8,
    bezier = "smooth"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "smooth"
})

hl.animation({
    leaf = "fadeDim",
    enabled = true,
    speed = 7,
    bezier = "smooth"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 7,
    bezier = "smooth",
    style = "slidevert" --slide or slidevert
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 15,
    bezier = "liner",
    style = "loop"
})
