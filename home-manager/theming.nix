{
	home.file.".local/share/SpeedCrunch/color-schemes/catppuccin-mocha.json".text = ''
{
  "cursor": "#f5e0dc",
  "number": "#fab387",
  "parens": "#cdd6f4",
  "result": "#a6e3a1",
  "comment": "#6c7086",
  "matched": "#94e2d5",
  "function": "#89b4fa",
  "operator": "#89dceb",
  "variable": "#f38ba8",
  "scrollbar": "#9399b2",
  "separator": "#9399b2",
  "background": "#1e1e2e",
  "editorbackground": "#313244"
}
	'';

	programs = {
		btop = {
			catppuccin.enable = true;
		};
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
