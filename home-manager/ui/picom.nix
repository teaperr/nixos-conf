{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;

		vSync = true;

		backend = "glx";

		shadow = true;
		shadowOffsets = [
			0
			0
		];

		fade = true;
		fadeSteps = [
			0.03
			0.03
		];

		wintypes = {
			popup_menu = { opacity = 0.8; };
			dropdown_menu = { opacity = 0.8; };
		};

		fadeExclude = [
			"name ~= 'Spectacle$'"
		];
		
		settings = {
			blur = {
				method = "gaussian";
				size = 10;
				deviation = 5.0;
			};
			blur-background-exclude = [
				"class_g != 'Alacritty'"
			];
		};
  };
}
