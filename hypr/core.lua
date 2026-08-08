--   ██████╗ ██████╗ ██████╗ ███████╗
--  ██╔════╝██╔═══██╗██╔══██╗██╔════╝
--  ██║     ██║   ██║██████╔╝█████╗
--  ██║     ██║   ██║██╔══██╗██╔══╝
--  ╚██████╗╚██████╔╝██║  ██║███████╗
--   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
--
--  Main configuration. Presets and colors are loaded by loader.lua.
--  Sections: FUNCTIONS · MONITOR · ENVIRONMENT · INPUT · GESTURES
--            LAYOUTS & MISC · WINDOW RULES · KEYBINDINGS · AUTOSTART · PLUGINS


-- =====================
-- FUNCTIONS
-- =====================

function activate_gamemode()
    hl.config({
        animations = { enabled = false },
        decoration = {
            shadow = { enabled = false },
            blur = { enabled = false },
            active_opacity = 1.0,
            inactive_opacity = 1.0,
            fullscreen_opacity = 1.0,
            rounding = 0
        },
        general = {
            gaps_in = 0,
            gaps_out = 0,
            border_size = 1
        }
    })
    print("Gamemode ON")
end


-- =====================
-- MONITOR
-- =====================

-- Default fallback — nwg-displays overwrites this at login
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

-- Your display (written by nwg-displays, kept here for reference)
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60.0",
    position = "0x0",
    scale = 1.0
})


-- =====================
-- ENVIRONMENT
-- =====================

-- Wayland
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("DESKTOP_SESSION", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- GDK
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("GDK_SCALE", "1")

-- Toolkit
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Quickshell
hl.env("QS_NO_RELOAD_POPUP", "1")

-- Paths (uncomment if needed)
-- hl.env("PATH", "$PATH:$HOME/.cargo/bin")
-- hl.env("PATH", "$PATH:$HOME/.local/bin")


-- =====================
-- INPUT
-- =====================

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = ",qwerty",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0, -- -1.0 to 1.0, 0 = no modification

        touchpad = {
            natural_scroll             = true,
            disable_while_typing       = true,
            scroll_factor              = 1.0,
            middle_button_emulation    = false,
            clickfinger_behavior       = false,
            drag_lock                  = false,
        },

        touchdevice = {
            transform = 0,
            output    = "",
        },
    },
})


-- =====================
-- GESTURES
-- =====================

-- 3-finger vertical → switch workspaces
hl.gesture({
    fingers   = 3,
    direction = "vertical",
    action    = "workspace"
})

-- 3-finger horizontal → scroll/move
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "scroll_move",
    scale     = 0.9,
})

-- 4-finger pinch out → fullscreen on
hl.gesture({ fingers = 4, direction = "pinchout", action = function()
    hl.dispatch(hl.dsp.window.fullscreen({ action = "set" }))
end})

-- 4-finger pinch in → fullscreen off
hl.gesture({ fingers = 4, direction = "pinchin", action = function()
    hl.dispatch(hl.dsp.window.fullscreen({ action = "unset" }))
end})

hl.config({
    gestures = {
        workspace_swipe_distance         = 300,
        workspace_swipe_invert           = true,
        workspace_swipe_min_speed_to_force = 30,
        workspace_swipe_cancel_ratio     = 0.5,
        workspace_swipe_create_new       = true,
        workspace_swipe_forever          = false,
    }
})


-- =====================
-- LAYOUTS & MISC
-- =====================

hl.config({
    dwindle = {
        smart_split    = false,
        preserve_split = true,
    },

    master = {
        -- new_status = "master"
    },

    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles   = true,
        pass_mouse_when_bound    = false,
        scroll_event_delay       = 0,
    },

    misc = {
        disable_hyprland_logo        = false,
        disable_splash_rendering     = true,
        initial_workspace_tracking   = 1,
        on_focus_under_fullscreen    = 1,
        allow_session_lock_restore   = true,
    },
})


-- =====================
-- WINDOW RULES
-- =====================

-- Quickshell layer blur
hl.layer_rule({
    match        = { namespace = "quickshell" },
    blur_popups  = true,
    blur         = true,
    xray         = false,
    ignore_alpha = 0.05,
})

-- pavucontrol
hl.window_rule({
    name   = "pavucontrol",
    match  = { class = "*org.pulseaudio.pavucontrol*" },
    float  = true,
    center = true,
    size   = "700 600"
})

-- Sober / Roblox — force full opacity
hl.window_rule({ match = { class = ".*Sober.*"   }, opacity = "1.0 override" })
hl.window_rule({ match = { class = ".*roblox.*"  }, opacity = "1.0 override" })

-- Zen browser
hl.window_rule({ match = { class = ".*zen.*"     }, opacity = "1.0 override" })

-- Media
hl.window_rule({ match = { class = ".*mpv.*"     }, opacity = "1.0 override" })

-- Games
hl.window_rule({ match = { class = ".*Minecraft.*"          }, opacity = "1.0 override" })
hl.window_rule({ match = { class = ".*steam_app_default.*"  }, opacity = "1.0 override" })
hl.window_rule({ match = { class = ".*paranormasight.*"     }, opacity = "1.0 override" })
hl.window_rule({ match = { class = ".*chrono.*"             }, opacity = "1.0 override" })
hl.window_rule({ match = { class = ".*octopath.*"           }, opacity = "1.0 override" })

-- Welcome App
hl.window_rule({
    name   = "ml4w-welcome-app",
    match  = { title = "ML4W Welcome" },
    float  = true,
    center = true,
    pin    = true,
    size   = "700 600"
})

-- Settings App
hl.window_rule({
    name   = "ml4w-settings-app",
    match  = { title = "ML4W Dotfiles Settings" },
    float  = true,
    center = true,
    pin    = true,
    size   = "900 600"
})

-- Waypaper
hl.window_rule({
    name   = "waypaper",
    match  = { class = "waypaper" },
    float  = true,
    center = false,
    pin    = true,
    size   = "300 700"
})

-- Newelle
hl.window_rule({
    name   = "newelle",
    match  = { class = "io.github.qwersyk.Newelle" },
    float  = true,
    center = true,
    pin    = true,
    size   = "1000 700"
})

-- Blueman
hl.window_rule({
    name   = "blueman-manager",
    match  = { class = "blueman-manager" },
    float  = true,
    center = true,
    size   = "800 600"
})

-- nwg-look
hl.window_rule({
    name   = "nwg-look",
    match  = { class = "nwg-look" },
    float  = true,
    center = true,
    size   = "700 600"
})

-- nwg-displays
hl.window_rule({
    name   = "nwg-displays",
    match  = { class = "nwg-displays" },
    float  = true,
    center = true,
    size   = "900 600"
})

-- Mission Center
hl.window_rule({
    name   = "missioncenter",
    match  = { class = "io.missioncenter.MissionCenter" },
    float  = true,
    center = true,
    pin    = true,
    size   = "900 600"
})

-- Calculator
hl.window_rule({
    name   = "gnome-calculator",
    match  = { class = "org.gnome.Calculator" },
    float  = true,
    center = true,
    size   = "700 600"
})

-- Hyprland Share Picker
hl.window_rule({
    name   = "hyprland-share-picker",
    match  = { class = "hyprland-share-picker" },
    float  = true,
    pin    = true,
    center = true,
    size   = "600 400"
})

-- nm-connection-editor
hl.window_rule({
    name   = "nm-connection-editor",
    match  = { class = "nm-connection-editor" },
    float  = true,
    center = true,
    size   = "800 700"
})

-- Floating terminal/app
hl.window_rule({
    name   = "dotfiles-floating",
    match  = { class = "dotfiles-floating" },
    float  = true,
    center = true,
    size   = "1000 700"
})

-- Sidepad
hl.window_rule({
    name   = "dotfiles-sidepad",
    match  = { class = "dotfiles-sidepad" },
    float  = true,
    pin    = true,
    center = true,
    size   = "1000 700"
})


-- =====================
-- KEYBINDINGS
-- =====================

local mainMod = "SUPER"

-- Applications
hl.bind(mainMod .. " + W",          hl.dsp.exec_cmd("~/.config/ml4w/settings/terminal.sh"),    { submap_universal = true, description = "Open terminal" })
hl.bind(mainMod .. " + RETURN",     hl.dsp.exec_cmd("~/.config/ml4w/settings/terminal.sh"),    { description = "Open terminal" })
hl.bind(mainMod .. " + B",          hl.dsp.exec_cmd("~/.config/ml4w/settings/browser.sh"),     { description = "Open browser" })
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd("~/.config/ml4w/settings/filemanager"),    { description = "Open file manager" })
hl.bind(mainMod .. " + CTRL + E",   hl.dsp.exec_cmd("~/.config/ml4w/settings/emojipicker.sh"),{ description = "Open emoji picker" })
hl.bind(mainMod .. " + SHIFT + C",  hl.dsp.exec_cmd("~/.config/ml4w/settings/calculator.sh"), { description = "Open calculator" })

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }),              { description = "Focus workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }),        { description = "Move window to workspace " .. i })
end

hl.bind(mainMod .. " + Z",          hl.dsp.focus({ workspace = "e-1" }),                       { description = "Previous workspace" })
hl.bind(mainMod .. " + SHIFT + Z",  hl.dsp.focus({ workspace = "e+1" }),                       { description = "Next workspace" })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }),                       { description = "Next workspace (scroll)" })
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }),                       { description = "Previous workspace (scroll)" })

-- Windows
hl.bind(mainMod .. " + Q",          hl.dsp.exec_cmd("~/.config/hypr/scripts/killactive.sh"),   { description = "Kill active window" })
hl.bind(mainMod .. " + SHIFT + Q",  hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"), { description = "Kill all instances" })
hl.bind(mainMod .. " + F",          hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + T",          hl.dsp.window.float({ action = "toggle" }),                { description = "Toggle floating" })
hl.bind(mainMod .. " + SHIFT + T",  hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-allfloat"),  { description = "Toggle float all windows" })
hl.bind(mainMod .. " + ALT + T",    hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-float-pin"), { description = "Toggle float + pin" })
hl.bind(mainMod .. " + J",          hl.dsp.layout("togglesplit"),                              { description = "Toggle split" })
hl.bind(mainMod .. " + K",          hl.dsp.layout("swapsplit"),                                { description = "Swap split" })
hl.bind(mainMod .. " + G",          hl.dsp.group.toggle(),                                     { description = "Toggle window group" })

-- Focus
hl.bind(mainMod .. " + left",       hl.dsp.focus({ direction = "left" }),                      { description = "Focus left" })
hl.bind(mainMod .. " + right",      hl.dsp.focus({ direction = "right" }),                     { description = "Focus right" })
hl.bind(mainMod .. " + up",         hl.dsp.focus({ direction = "up" }),                        { description = "Focus up" })
hl.bind(mainMod .. " + down",       hl.dsp.focus({ direction = "down" }),                      { description = "Focus down" })

-- Swap tiled windows
hl.bind(mainMod .. " + ALT + left",  hl.dsp.window.swap({ direction = "l" }),                 { description = "Swap window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }),                 { description = "Swap window right" })
hl.bind(mainMod .. " + ALT + up",    hl.dsp.window.swap({ direction = "u" }),                 { description = "Swap window up" })
hl.bind(mainMod .. " + ALT + down",  hl.dsp.window.swap({ direction = "d" }),                 { description = "Swap window down" })

-- Mouse window control
hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(),                                     { mouse = true, description = "Drag window" })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(),                                   { mouse = true, description = "Resize window" })

-- Mouse scroll resize
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.resize({ x = 0,    y = 100,  relative = true }))
hl.bind(mainMod .. " + SHIFT + mouse_up",   hl.dsp.window.resize({ x = 0,    y = -100, relative = true }))
hl.bind(mainMod .. " + CTRL + mouse_down",  hl.dsp.window.resize({ x = 100,  y = 0,    relative = true }))
hl.bind(mainMod .. " + CTRL + mouse_up",    hl.dsp.window.resize({ x = -100, y = 0,    relative = true }))

-- Actions
hl.bind(mainMod .. " + CTRL + R",   hl.dsp.exec_cmd("hyprctl reload"),                        { description = "Reload Hyprland" })
hl.bind(mainMod .. " + SHIFT + R",  hl.dsp.exec_cmd("~/.config/hypr/scripts/loadconfig.sh"), { description = "Reload config" })
hl.bind(mainMod .. " + SHIFT + A",  hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-animations.sh"), { description = "Toggle animations" })
hl.bind(mainMod .. " + PRINT",      hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"),  { description = "Screenshot" })
hl.bind(mainMod .. " + ALT + F",    hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"),  { description = "Fullscreen screenshot" })
hl.bind(mainMod .. " + ALT + S",    hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"),  { description = "Area screenshot" })
hl.bind(mainMod .. " + ALT + A",    hl.dsp.exec_cmd("~/.config/hypr/scripts/text-extractor.sh"), { description = "Extract text from area" })
hl.bind(mainMod .. " + CTRL + L",   hl.dsp.exec_cmd("pidof hyprlock || hyprlock"),            { description = "Lock screen" })
hl.bind(mainMod .. " + V",          hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-cliphist"),  { description = "Clipboard manager" })
hl.bind(mainMod .. " + ALT + G",    hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh"),    { description = "Toggle gamemode" })

-- Waybar
hl.bind(mainMod .. " + SHIFT + B",  hl.dsp.exec_cmd("~/.config/waybar/launch.sh"),            { description = "Reload waybar" })
hl.bind(mainMod .. " + CTRL + B",   hl.dsp.exec_cmd("~/.config/waybar/toggle.sh"),            { description = "Toggle waybar" })
hl.bind(mainMod .. " + CTRL + T",   hl.dsp.exec_cmd("~/.config/waybar/themeswitcher.sh"),     { description = "Waybar theme switcher" })

-- Wallpaper
hl.bind(mainMod .. " + SHIFT + W",  hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app --random"),   { description = "Random wallpaper" })
hl.bind(mainMod .. " + ALT + W",    hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-automation"),     { description = "Wallpaper automation" })

-- Theme
hl.bind(mainMod .. " + SHIFT + M",  hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-theme"),             { description = "Toggle light/dark mode" })
hl.bind(mainMod .. " + SHIFT + H",  hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-hyprsunset"),        { description = "Toggle hyprsunset" })
hl.bind("CTRL + ALT + T",           hl.dsp.exec_cmd("~/.config/ml4w/themes/themes.sh"),                      { description = "Theme selector" })

-- Launchers
hl.bind(mainMod .. " + X",          hl.dsp.exec_cmd("~/.config/hypr/scripts/launcher.sh"),    { description = "App launcher" })
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd("~/.config/hypr/scripts/launcher.sh"),{ description = "App launcher (alt)" })
hl.bind(mainMod .. " + CTRL + K",   hl.dsp.exec_cmd("~/.config/hypr/scripts/keybindings.sh"),{ description = "Show keybindings" })

-- Tide Island
hl.bind("SUPER + SLASH",            hl.dsp.exec_cmd("qs ipc -p /usr/share/tide-island call tide toggleSearch"),              { description = "App search" })
hl.bind("SUPER + D",                hl.dsp.exec_cmd("qs ipc -p /usr/share/tide-island call tide toggleSearch"),              { description = "App search (alt)" })
hl.bind("SUPER + CTRL + W",         hl.dsp.exec_cmd("qs ipc -p /usr/share/tide-island call wallpaper-picker toggle"),       { description = "Wallpaper picker" })
hl.bind("SUPER + C",                hl.dsp.exec_cmd("qs ipc -p /usr/share/tide-island call tide toggleControlCenter"),      { description = "Control center" })
hl.bind("SUPER + P",                hl.dsp.exec_cmd("qs ipc -p /usr/share/tide-island call tide togglePowerMenu"),          { description = "Power menu" })
hl.bind("SUPER + N",                hl.dsp.exec_cmd("qs ipc -p /usr/share/tide-island call tide toggleNotificationCenter"), { description = "Notification center" })
hl.bind("SUPER + R",                hl.dsp.exec_cmd("qs ipc call radialMenu open"),            { description = "Radial menu" })
hl.bind(mainMod .. " + ALT + M",    hl.dsp.exec_cmd("qs ipc call display toggle"),            { description = "Display manager" })
hl.bind(mainMod .. " + CTRL + S",   hl.dsp.exec_cmd("qs ipc call sidebar toggle"),            { description = "Sidebar widget" })
hl.bind(mainMod .. " + CTRL + C",   hl.dsp.exec_cmd("qs ipc call calendar toggle"),           { description = "Calendar widget" })
hl.bind(mainMod .. " + CTRL + P",   hl.dsp.exec_cmd("qs ipc call power toggle"),              { description = "Power menu (alt)" })

-- Overview (scrolloverview plugin)
hl.bind("SUPER + TAB", function()
    hl.plugin.scrolloverview.overview("toggle")
end)

-- Infinite Desktop
hl.bind("SUPER + Y",                hl.dsp.exec_cmd("python3 ~/scripts/floating_tile_toggle.py"),          { description = "Toggle mosaic/floating" })
hl.bind("SUPER + CTRL + left",      hl.dsp.exec_cmd("python3 ~/scripts/move_window.py left"),              { description = "Move floating left" })
hl.bind("SUPER + CTRL + right",     hl.dsp.exec_cmd("python3 ~/scripts/move_window.py right"),             { description = "Move floating right" })
hl.bind("SUPER + CTRL + up",        hl.dsp.exec_cmd("python3 ~/scripts/move_window.py up"),                { description = "Move floating up" })
hl.bind("SUPER + CTRL + down",      hl.dsp.exec_cmd("python3 ~/scripts/move_window.py down"),              { description = "Move floating down" })
hl.bind("SUPER + SHIFT + left",     hl.dsp.exec_cmd("python3 ~/scripts/navigate_windows.py left"),         { description = "Navigate canvas left" })
hl.bind("SUPER + SHIFT + right",    hl.dsp.exec_cmd("python3 ~/scripts/navigate_windows.py right"),        { description = "Navigate canvas right" })
hl.bind("SUPER + SHIFT + up",       hl.dsp.exec_cmd("python3 ~/scripts/navigate_windows.py up"),           { description = "Navigate canvas up" })
hl.bind("SUPER + SHIFT + down",     hl.dsp.exec_cmd("python3 ~/scripts/navigate_windows.py down"),         { description = "Navigate canvas down" })
hl.bind("SUPER + ALT + CTRL + left",  hl.dsp.exec_cmd("python3 ~/scripts/resize_window.py left"),         { description = "Shrink width" })
hl.bind("SUPER + ALT + CTRL + right", hl.dsp.exec_cmd("python3 ~/scripts/resize_window.py right"),        { description = "Grow width" })
hl.bind("SUPER + ALT + CTRL + up",    hl.dsp.exec_cmd("python3 ~/scripts/resize_window.py up"),           { description = "Shrink height" })
hl.bind("SUPER + ALT + CTRL + down",  hl.dsp.exec_cmd("python3 ~/scripts/resize_window.py down"),         { description = "Grow height" })

-- Media & hardware keys
hl.bind("XF86Calculator",           hl.dsp.exec_cmd("qalculate-gtk"),                         { description = "Calculator" })
hl.bind("XF86AudioRaiseVolume",     hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",     hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",      hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
hl.bind("XF86AudioNext",            hl.dsp.exec_cmd("playerctl next"),                        { locked = true })
hl.bind("XF86AudioPause",           hl.dsp.exec_cmd("playerctl play-pause"),                  { locked = true })
hl.bind("XF86AudioPlay",            hl.dsp.exec_cmd("playerctl play-pause"),                  { locked = true })
hl.bind("XF86AudioPrev",            hl.dsp.exec_cmd("playerctl previous"),                    { locked = true })


-- =====================
-- AUTOSTART
-- =====================

hl.on("hyprland.start", function()
    -- Cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 2")
    -- Listeners
    hl.exec_cmd("~/.config/ml4w/listeners.sh --startall")
    -- Polkit
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    -- Wallpaper restore
    hl.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app --restore")
    -- Autostart scripts
    hl.exec_cmd("~/.config/ml4w/scripts/ml4w-autostart")
    -- GTK settings
    hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")
    -- Idle daemon
    hl.exec_cmd("hypridle")
    -- Clipboard history
    hl.exec_cmd("wl-paste --watch cliphist store")
    -- XDG portal env
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    -- Cleanup
    hl.exec_cmd("~/.config/hypr/scripts/cleanup.sh")
    -- Gnome keyring
    hl.exec_cmd("gnome-keyring-daemon --daemonize --start --components=gpg,pkcs11,secrets,ssh")
    -- Network manager tray
    hl.exec_cmd("nm-applet --indicator")
    -- Infinite desktop core
    hl.exec_cmd("python3 ~/scripts/infinite_desktop_core.py 1.6 > /tmp/infinite-desktop.log 2>&1")
    -- Plugin reload
    hl.exec_cmd("hyprpm reload")
end)


-- =====================
-- PLUGINS
-- =====================

hl.config({
    plugin = {
        scrolloverview = {
            gesture_distance = 300,
            scale            = 0.7,
            workspace_gap    = 200,
            layout           = "horizontal",
            wallpaper        = 0,
            blur             = false,

            input = {
                drag_mode            = 0,
                drag_threshold       = 10,
                left_handed          = 0,
                scroll_event_delay   = 50,
                touchpad_scroll_factor = 1.0,
                scrolling_mode       = 2,
            },

            shadow = {
                enabled      = false,
                range        = 50,
                render_power = 3,
                color        = 0xee1a1a1a,
            },
        },
    },
})

-- Workspace slide animation (verthori plugin)
hl.animation({ leaf = "workspaces", enabled = true, speed = 8, bezier = "smooth", style = "slide" })
