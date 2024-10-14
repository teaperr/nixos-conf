{ config, pkgs, ... }:

{
	programs.yazi = {
		enable = true;
		catppuccin.enable = true;
		enableZshIntegration = true;
		settings = {
			opener = {
				play = [
					{ run = "vlc \"$@\""; orphan = true; for = "unix"; }
				];
			};
			manager = {
				show_hidden = true;
				sort_by = "modified";
				sort_dir_first = false;
			};
		};
		keymap = {
			manager.prepend_keymap = [
				{ on = [ "g" "n" ]; run = "cd ~/nixos-conf"; desc = "go to nix config"; }
				{ on = [ "g" "D" ]; run = "cd ~/Documents"; desc = "go to documents"; }
				{ on = [ "g" "v" ]; run = "cd ~/vaults"; desc = "go to vaults"; }
			];
		};
	};
}
