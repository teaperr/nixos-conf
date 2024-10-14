{
	imports = [
		./config.nix

		./config/askpass.nix
		./config/bluetooth.nix
		./config/colors.nix
		./config/confirm.nix
		./config/font.nix
		./config/launcher.nix
		./config/musicmenu.nix
		./config/networkmenu.nix
		./config/network.nix
		./config/powermenu.nix
		./config/runner.nix
		./config/screenshot.nix

		./bin/launcher.nix
		./bin/musicmenu.nix
		./bin/powermenu.nix
		./bin/runner.nix
		./bin/screenshot.nix
		./bin/window.nix
	];
	home.file = {
		".local/bin/lock".text = ''betterlockscreen -l --span
betterlockscreen -u /home/lotus/nixos-conf/home-manager/common/assets/wallpaper.jpg &
		'';
	};
}
