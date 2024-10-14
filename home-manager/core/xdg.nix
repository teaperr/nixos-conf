{ pkgs, config, ... }:

{
	xdg = {
		enable = true;
		mimeApps = {
			defaultApplications = {
				"video/*" = [ "vlc.desktop" "librewolf.desktop" ];
			};
		};
	};
}
