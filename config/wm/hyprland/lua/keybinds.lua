-- variables ─────────────────────────────────────────────────────────
mod        = "SUPER"
modshift   = "SUPER + SHIFT"
modctrl    = "SUPER + CTRL"
term       = "ghostty"
menu       = "wofi --show drun"
browser    = "zen"
files      = "nemo"
calculator = "speedcrunch"

-- apps ──────────────────────────────────────────────────────────────
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(term))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(files))

-- discord mute and deafen bind passthrough for vesktop
-- toggle mute bind
hl.bind("CTRL + SHIFT + ALT + EQUAL", function()
	hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "code:58", window = "class:^(vesktop)$" }))
end)
-- toggle deafen bind
hl.bind("CTRL + SHIFT + ALT + MINUS", function()
	hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "code:100", window = "class:^(vesktop)$" }))
end)

-- replay buffer bind passthrough for obs
-- save buffer
hl.bind("CTRL + SHIFT + ALT + E", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))

-- window management ─────────────────────────────────────────────────
hl.bind(modshift .. " + Q", hl.dsp.window.close())
hl.bind(modshift .. " + E", function() hl.dsp.exit() end)
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + semicolon", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + C", hl.dsp.window.center())

-- alt tab
-- hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous_per_monitor" }))
hl.bind(mod .. " + TAB", hl.dsp.focus({ monitor = "+1" }))
hl.bind(modshift .. " + TAB", hl.dsp.focus({ monitor = "-1" }))

-- focus — vim hjkl ──────────────────────────────────────────────────
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))

-- move windows — vim hjkl ───────────────────────────────────────────
hl.bind(modshift .. " + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(modshift .. " + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(modshift .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(modshift .. " + J", hl.dsp.window.move({ direction = "down" }))

-- resize — vim hjkl ────────────────────────────────────────────────
hl.bind(modctrl .. " + H", hl.dsp.window.resize({ x = -40, y = 0 }))
hl.bind(modctrl .. " + L", hl.dsp.window.resize({ x = 40, y = 0 }))
hl.bind(modctrl .. " + K", hl.dsp.window.resize({ x = 0, y = -40 }))
hl.bind(modctrl .. " + J", hl.dsp.window.resize({ x = 0, y = 40 }))

-- workspaces ────────────────────────────────────────────────────────
for i = 1, 9 do
	hl.bind(mod .. " + " .. tostring(i), hl.dsp.focus({ workspace = i }))
	hl.bind(modshift .. " + " .. tostring(i), hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(modshift .. " + 0", hl.dsp.window.move({ workspace = 10 }))

-- scratchpad ────────────────────────────────────────────────────────
hl.bind(mod .. " + N", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(modshift .. " + N", hl.dsp.window.move({ workspace = "special:scratchpad" }))
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(modshift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mod .. " + O", hl.dsp.workspace.toggle_special("obs"))
hl.bind(modshift .. " + O", hl.dsp.window.move({ workspace = "special:obs" }))
hl.bind(mod .. " + R", hl.dsp.workspace.toggle_special("secondary"))
hl.bind(modshift .. " + R", hl.dsp.window.move({ workspace = "special:secondary" }))

-- screenshots ───────────────────────────────────────────────────────
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen all"))
hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
-- screenshot focused monitor to clipboard
hl.bind("SHIFT + Print",
	hl.dsp.exec_cmd(
		"noctalia msg screenshot-fullscreen $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')"),
	{ locked = true, })

-- utilities ─────────────────────────────────────────────────────────
hl.bind(modshift .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mod .. " + X", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind(modshift .. " + F12", hl.dsp.exec_cmd("pkill -9 Overwatch.exe"))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("pkill wl-crosshair || ~/.config/hypr/config/bash/crosshair-picker.sh"))

-- mouse bindings ────────────────────────────────────────────────────
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- media / volume (repeat-enabled) ───────────────────────────────────
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = true, locked = true })
hl.bind(mod .. " + page_up", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true, locked = true })
hl.bind(mod .. " + page_down", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })

-- media (no repeat) ─────────────────────────────────────────────────
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl prev"), { locked = true })

-- Spotify controls (SUPER + arrows)
hl.bind(mod .. " + right", hl.dsp.exec_cmd("playerctl -p spotify next"), { locked = true })
hl.bind(mod .. " + left", hl.dsp.exec_cmd("playerctl -p spotify previous"), { locked = true })
hl.bind(mod .. " + up", hl.dsp.exec_cmd("playerctl -p spotify play-pause"), { locked = true })
hl.bind("pause", hl.dsp.exec_cmd("playerctl -p spotify play-pause"), { locked = true })
hl.bind(mod .. " + down", hl.dsp.exec_cmd("playerctl -p spotify stop"), { locked = true })
hl.bind(modshift .. " + page_up", hl.dsp.exec_cmd("playerctl -p spotify volume 0.05+"),
	{ repeating = true, locked = true })
hl.bind(modshift .. " + page_down", hl.dsp.exec_cmd("playerctl -p spotify volume 0.05-"),
	{ repeating = true, locked = true })

-- LibreWolf/Firefox MPRIS controls (SUPER+SHIFT + arrows)
hl.bind(modshift .. " + right", hl.dsp.exec_cmd("playerctl -p firefox next"))
hl.bind(modshift .. " + left", hl.dsp.exec_cmd("playerctl -p firefox previous"))
hl.bind(modshift .. " + up", hl.dsp.exec_cmd("playerctl -p firefox play-pause"))
hl.bind(modshift .. " + down", hl.dsp.exec_cmd("playerctl -p firefox stop"))
