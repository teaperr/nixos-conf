-- workspace to monitor bindings
hl.workspace_rule({ workspace = 1, monitor = monitor_primary, default = true })
hl.workspace_rule({ workspace = 2, monitor = monitor_secondary, default = true })
hl.workspace_rule({ workspace = 3, monitor = monitor_primary })
hl.workspace_rule({ workspace = 4, monitor = monitor_primary })
hl.workspace_rule({ workspace = 5, monitor = monitor_secondary })
hl.workspace_rule({ workspace = 6, monitor = monitor_primary })
hl.workspace_rule({ workspace = 7, monitor = monitor_primary })
hl.workspace_rule({ workspace = 8, monitor = monitor_secondary })
hl.workspace_rule({ workspace = 9, monitor = monitor_secondary })
hl.workspace_rule({ workspace = 10, monitor = monitor_secondary })

-- application workspace assignments
hl.window_rule({ match = { class = "com.mitchellh.ghostty" }, workspace = "1" })

hl.window_rule({ match = { class = "discord" }, workspace = "2" })
hl.window_rule({ match = { class = "vesktop" }, workspace = "2" })

hl.window_rule({ match = { class = "librewolf" }, workspace = "3" })
hl.window_rule({ match = { class = "zen" }, workspace = "3" })

hl.window_rule({ match = { class = "steam" }, workspace = "4 silent" })

hl.window_rule({ match = { class = "spotify" }, workspace = "5 silent" })

hl.window_rule({
	name = "design",
	match = { tag = "design" },
	workspace = "6 silent",
})

hl.window_rule({
	name = "game",
	match = { tag = "game" },
	immediate = true,
	fullscreen = true,
	workspace = "7 silent",
	monitor = monitor_primary,
	render_unfocused = true,
	idle_inhibit = "always",
})

hl.window_rule({ match = { class = "nemo" }, workspace = "9 silent" })

hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, workspace = "special:magic" })

hl.window_rule({ match = { class = "org.speedcrunch." }, workspace = "special:scratchpad" })
hl.window_rule({
	match = { class = "com.ghostty.notes" },
	tag = "+notes",
	workspace = "special:scratchpad",
	fullscreen = "1",
	fullscreen_state = "1",
})

hl.window_rule({ match = { class = "com.obsproject.Studio" }, workspace = "special:obs" })
