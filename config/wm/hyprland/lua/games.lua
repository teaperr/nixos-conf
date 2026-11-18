local function setup_vkfix()
	if hl.plugin.csgo_vulkan_fix ~= nil then
		hl.plugin.csgo_vulkan_fix.vkfix_app({ app = "cs2", w = 1440, h = 1080 })
		hl.config({
			plugin = {
				csgo_vulkan_fix = { fix_mouse = true },
			},
		})
	end
end

setup_vkfix()

hl.window_rule({ match = { class = "StardewModdingAPI" }, workspace = "7 silent", fullscreen = 1 })
hl.window_rule({ match = { initial_class = "XTerm" }, workspace = "7 silent" })
hl.window_rule({ match = { initial_class = "HytaleClient" }, workspace = "7 silent" })
hl.window_rule({ match = { class = "Project Zomboid" }, workspace = "7 silent", fullscreen = 1 })
hl.window_rule({ match = { class = "Celeste" }, workspace = "7 silent", fullscreen = 1 })
hl.window_rule({ match = { class = "EverestSplash-linux" }, workspace = "7 silent", fullscreen = 1 })
hl.window_rule({ match = { class = "tf_linux64" }, workspace = "7 silent", fullscreen = 1 })

hl.window_rule({ name = "gametag", match = { class = "^(steam_app_*)$" }, tag = "+game" })
hl.window_rule({ name = "gametag", match = { class = "^(factorygamesteam-win64-shipping.exe)$" }, tag = "+game" })
hl.window_rule({ name = "gametag", match = { class = "overwatch.exe" }, tag = "+game" })
hl.window_rule({ name = "gametag", match = { class = "^(ULTRAKILL*)$" }, tag = "+game" })
hl.window_rule({ name = "gametag", match = { class = "^(UNDERTALE)$" }, tag = "+game" })

hl.window_rule({
	name = "game",
	match = { tag = "game" },
	immediate = true,
	fullscreen = true,
	workspace = "7 silent",
	monitor = monitor_primary,
	render_unfocused = true,
	idle_inhibit = "always",
	opaque = true,
	no_dim = true,
	no_blur = true,
	no_shadow = true
})

hl.window_rule({
	match = { class = "gamescope" },
	immediate = true,
})
