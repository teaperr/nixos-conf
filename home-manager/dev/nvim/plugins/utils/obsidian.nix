{ config, pkgs, ... }:
{
  programs.nixvim = {
		plugins.obsidian = {
			enable = true;
			settings = {
				workspaces = [
					{
						name = "Misc";
						path = "~/vaults/misc";
					}
				];
			};
		};
  };
}
