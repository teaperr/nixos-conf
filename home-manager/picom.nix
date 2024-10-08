{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;

		vSync = true;

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
  };
}
