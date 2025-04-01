{ pkgs, config, ... }:

{
	home.packages = with pkgs; [
		hack-font
		nerd-fonts.hack
	];

	fonts = {
		fontconfig = {
			enable = true;
			defaultFonts = {
				monospace = [
					"Hack Nerd Font Mono"
				];
			};
		};
	};
}
