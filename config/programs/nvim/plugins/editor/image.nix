{ pkgs, config, ... }:

{
	programs.nixvim = {
		plugins.image = {
			enable = true;
			settings = {
				backend = "ueberzug";
				ueberzugPackage = pkgs.ueberzugpp;
				tmux_show_only_in_active_window = true;
				# integrations = {
				# 	markdown = {
				# 		enabled = true;
				# 		clearInInsertMode = true;
				# 		downloadRemoteImages = true;
				# 		onlyRenderImageAtCursor = true;
				# 	};
				# };
			};
		};
	};
}
