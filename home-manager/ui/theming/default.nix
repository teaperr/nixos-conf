{
	imports = [
		./catppuccinColors.nix
	];
	programs = {

	};
  catppuccin = {
		waybar.enable = true;
    enable = true;
    flavor = "mocha";
    accent = "pink";
  };

  gtk = {
    enable = false;
		catppuccin = {
			enable = false;
		};
  };

  qt = {
    enable = true;
		platformTheme.name = "kvantum";
    style = {
			name = "kvantum";
			catppuccin = {
				enable = true;
				apply = true;
			};
    };
  };

	services.dunst = {
		enable = true;
		catppuccin.enable = true;
		
	};
}
