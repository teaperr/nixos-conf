{ pkgs, config, ... }:

{
	services.flameshot = {
		enable = true;
		settings = {
			General = {
				disabledTrayIcon = true;
				uiColor = "#f5c2e7";
			};
		};
	};
}
