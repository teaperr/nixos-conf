{ pkgs, config, ... }:

{
	home.packages = with pkgs; [
		hack-font
		hackgen-nf-font
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
