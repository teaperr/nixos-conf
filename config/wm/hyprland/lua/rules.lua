-- force float
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = false })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "imv" }, float = true })
hl.window_rule({ match = { class = "mpv" }, float = true })
hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })
hl.window_rule({ match = { title = "Multithreaded Download Manager Enhanced" }, float = true })

-- sizing / placement
hl.window_rule({ match = { class = "nm-connection-editor" }, size = "900 600" })
hl.window_rule({ match = { class = "nm-connection-editor" }, center = true })

-- Picture-in-Picture
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, keep_aspect_ratio = true })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, move = { "(monitor_w*0.73)", "(monitor_h*0.72)" } })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, size = { "(monitor_w*0.25)", "(monitor_h*0.25)" } })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, pin = true })

-- idle inhibit
hl.window_rule({ match = { class = "firefox" }, idle_inhibit = "fullscreen" })
hl.window_rule({ match = { class = "mpv" }, idle_inhibit = "fullscreen" })

-- ghostty
hl.window_rule({ match = { class = "com.mitchellh.ghostty" }, no_blur = true })

-- steam
hl.window_rule({ match = { class = "steam" }, float = true, no_initial_focus = true })
hl.window_rule({ match = { class = "steam", initial_class = "steam", title = "Steam", initial_title = "Steam" }, float = false, no_initial_focus = true })

-- games
hl.window_rule({ name = "gametag", match = { class = "^(steam_.*|cs2|tf_*|gamescope)$" }, tag = "+game" })

-- design programs
hl.window_rule({
	name = "designtag",
	match = { class = "^(org.kde.kdenlive|org.freecad.FreeCAD|OrcaSlicer|losslesscut|FunPlayer)$" },
	tag =
	"+design"
})

-- floating window rules
hl.window_rule({ match = { title = "^(Open File)(.*)$" }, center = true })
hl.window_rule({ match = { title = "^(Open File)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, center = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Open Folder)(.*)$" }, center = true })
hl.window_rule({ match = { title = "^(Open Folder)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, center = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Library)(.*)$" }, center = true })
hl.window_rule({ match = { title = "^(Library)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, center = true })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(.*)(wants to save)$" }, center = true })
hl.window_rule({ match = { title = "^(.*)(wants to save)$" }, float = true })
hl.window_rule({ match = { title = "^(.*)(wants to open)$" }, center = true })
hl.window_rule({ match = { title = "^(.*)(wants to open)$" }, float = true })
hl.window_rule({ match = { title = "^(Copying — Dolphin)$" }, move = { 40, 80 } })
