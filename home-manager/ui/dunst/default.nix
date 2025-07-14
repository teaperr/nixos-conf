{ config, pkgs, ... }:

{
	services.dunst = {
		enable = true;
		settings = {
			global = {
				frame_width = 2;
				frame_color = "#89b4fa";
				separator_color = "frame";
				font = "Hack Nerd Font 9"; 
				corner_radius = 8;
				padding = 10;
				horizontal_padding = 10;
				width = 300;
				height = 80;
			};

			urgency_low = {
				background = "#1e1e2e";
				foreground = "#cdd6f4";
			};
			urgency_normal = {
				background = "#1e1e2e";
				foreground = "#cdd6f4";
			};
			urgency_critical = {
				background = "#1e1e2e";
				foreground = "#cdd6f4";
				frame_color = "#fab387";
			};
		};
	};
}
