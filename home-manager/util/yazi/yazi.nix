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
				{ on = [ "g" "v" ]; run = "cd ~/vaults"; desc = "go to vaults"; }
				{ on = [ "g" "D" "D" ]; run = "cd ~/Documents"; desc = "go to documents"; }
				{ on = [ "g" "D" "p" ]; run = "cd ~/Documents/Personal"; desc = "go to personal documents"; }
				{ on = [ "g" "D" "c" ]; run = "cd ~/Documents/College"; desc = "go to college documents"; }
				{ on = [ "g" "l" ]; run = "cd ~/.local"; desc = "go to ~/.local"; }
				{ on = [ "c" "m" ]; run = "plugin chmod"; desc = "Chmod selected file"; }
				{ on = [ "T" ]; run = "plugin --sync max-preview"; desc = "Toggle max preview"; }
			];
		};
	};
}
