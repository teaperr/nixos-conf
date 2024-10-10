{ pkgs, config, ... }:

{
	programs.nixvim = {
		plugins.image = {
			enable = true;
			backend = "ueberzug";
			ueberzugPackage = pkgs.ueberzugpp;
			tmuxShowOnlyInActiveWindow = true;
			integrations = {
				markdown = {
					enabled = true;
					clearInInsertMode = true;
					downloadRemoteImages = true;
					onlyRenderImageAtCursor = true;
				};
			};
		};
	};
}
