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
				show_hidden = false;
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
				# { on = [ "1" ]; run = "plugin relative-motions --args=1"; desc = "Move in relative steps"; }
				# { on = [ "2" ]; run = "plugin relative-motions --args=2"; desc = "Move in relative steps"; }
				# { on = [ "3" ]; run = "plugin relative-motions --args=3"; desc = "Move in relative steps"; }
				# { on = [ "4" ]; run = "plugin relative-motions --args=4"; desc = "Move in relative steps"; }
				# { on = [ "5" ]; run = "plugin relative-motions --args=5"; desc = "Move in relative steps"; }
				# { on = [ "6" ]; run = "plugin relative-motions --args=6"; desc = "Move in relative steps"; }
				# { on = [ "7" ]; run = "plugin relative-motions --args=7"; desc = "Move in relative steps"; }
				# { on = [ "8" ]; run = "plugin relative-motions --args=8"; desc = "Move in relative steps"; }
				# { on = [ "9" ]; run = "plugin relative-motions --args=9"; desc = "Move in relative steps"; }
			];
		};
	};
}
