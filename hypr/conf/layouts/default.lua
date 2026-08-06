-- -----------------------------------------------------
-- Layouts & System Settings
-- -----------------------------------------------------

hl.config({
    dwindle = {
	smart_split = false,
        preserve_split = true,
    },
    
    -- Master layout is handled here if needed
    master = {
        -- new_status = "master" -- Commented out due to compatibility reasons
    },

-- Pads a solo/master window down from full-monitor size to this aspect
-- ratio, so togglefloating no longer uses full-screen size as its base
-- (root cause of the "maximize then shrink" flash)
 -- single_window_aspect_ratio = {1, 1},


    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = true,
        pass_mouse_when_bound = false,
    },
})
