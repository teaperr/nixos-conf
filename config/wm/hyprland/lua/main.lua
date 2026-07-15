-- global variables
monitor_primary   = "desc:AOC 24G2W1G4 0x00016A47"
monitor_secondary = "desc:Ancor Communications Inc ASUS VS228 E8LMTF150829"

-- imports
require("config.keybinds")
require("config.games")
require("config.autostart")
require("config.wallpaper")
require("config.workspaces")
require("config.rules")

-- ── Monitors ────────────────────────────────────────────────────────
hl.monitor({
	output = monitor_primary,
	mode = "1920x1080@144",
	position = "0x0",
	scale = 1,
	vrr = false,
})

hl.monitor({
	output = monitor_secondary,
	mode = "1920x1080@60",
	position = "1920x0",
	scale = 1,
})

-- ── Environment ─────────────────────────────────────────────────────
hl.env("XCURSOR_SIZE", "18")
hl.env("XCURSOR_THEME", "Catppuccin-Mocha-Dark-Cursors")
-- hl.env("QT_QPA_PLATFORM", "wayland")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
-- hl.env("GDK_BACKEND", "wayland,x11")
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("MOZ_ENABLE_WAYLAND", "1")
-- hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
-- hl.env("NVD_BACKEND", "direct")

hl.env("XCURSOR_SIZE", "18")
hl.env("XCURSOR_THEME", "Catppuccin-Mocha-Dark-Cursors")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("NVD_BACKEND", "direct")

-- ── Input ───────────────────────────────────────────────────────────
hl.device({
	name = "endgame-gear-endgame-gear-op1-8k-v2-gaming-mouse",
	sensitivity = -1
})

-- ── General ─────────────────────────────────────────────────────────
-- colors set by catppuccin module
hl.config({
	general = {
		gaps_in       = 4,
		gaps_out      = 8,
		border_size   = 2,
		allow_tearing = false,
	},

	input = {
		follow_mouse = 1,
		mouse_refocus = true,
	},

	-- ── Decoration ────────────────────────────────────────────────────
	decoration = {
		rounding           = 8,
		active_opacity     = 1.0,
		inactive_opacity   = 1.0,
		fullscreen_opacity = 1.0,
		blur               = {
			enabled           = true,
			size              = 6,
			passes            = 3,
			new_optimizations = true,
			xray              = false,
		},
		shadow             = {
			enabled      = true,
			range        = 12,
			render_power = 3,
		},
	},

	render = {
		cm_sdr_eotf = "sRGB",
	},

	-- ── Animations ────────────────────────────────────────────────────
	animations = {
		enabled = true,
	},

	-- ── Layouts ───────────────────────────────────────────────────────
	dwindle = {
		preserve_split = true,
		smart_resizing = true,
	},

	master = {
		new_status = "slave",
		mfact      = 0.5,
	},

	-- ── Misc ──────────────────────────────────────────────────────────
	misc = {
		force_default_wallpaper  = 0,
		disable_hyprland_logo    = true,
		disable_splash_rendering = true,
	},
})

-- ── Curves ────────────────────────────────────────────────────────────
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- ── Animations ────────────────────────────────────────────────────────
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "quick", style = "popin 87%" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- noctalia integration
dofile(os.getenv("HOME") .. "/.config/hypr/noctalia.lua")
