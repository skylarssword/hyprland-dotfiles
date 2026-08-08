-- -----------------------------------------------------
-- Animations
-- Smooth End4
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
    points = { {0.22, 1.0}, {0.36, 1.0} }
})

hl.curve("move", {
    type = "bezier",
    points = { {0.18, 0.95}, {0.28, 1.0} }
})

--------------------------------------------------------------------------------
-- Rules
--------------------------------------------------------------------------------

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "smooth",
    style = "popin 60%"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "smooth",
    style = "popin 60%"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "smooth",
    style = "popin 60%"
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 4,
    bezier = "move",
    style = "slide"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 6,
    bezier = "default"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4,
    bezier = "smooth"
})

hl.animation({
    leaf = "fadeDim",
    enabled = true,
    speed = 4,
    bezier = "smooth"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "smooth"
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 30,
    bezier = "default",
    style = "loop"
})
