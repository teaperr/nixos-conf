{
	programs = {

	};
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "pink";
  };

  gtk = {
    enable = true;
		catppuccin = {
			enable = true;
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
