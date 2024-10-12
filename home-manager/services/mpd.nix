{ config, pkgs, ... }:
let
  mpdPassword = builtins.readFile "/home/lotus/.config/secrets/mpdscribble";
in
{
	services.mpd = {
    enable = true;
		musicDirectory = "~/Music";
		extraConfig = ''music_directory     "~/Music"
playlist_directory  "~/.config/mpd/playlists"
db_file             "~/.config/mpd/database"
log_file            "~/.config/mpd/log"
log_level           "verbose"
pid_file            "~/.config/mpd/pid"
state_file          "~/.config/mpd/state"
auto_update         "yes"
audio_output {
	type            "pipewire"
	name            "Pipewire sound"
	mixer_type      "software"
}
		'';
  };

	home.file.".config/mpdscribble/mpdscribble.conf".text = ''
verbose = 1

host = localhost

port = 6600

[last.fm]
url = https://post.audioscrobbler.com/
username = tittyfiddler
password = ${mpdPassword}
'';

	home.file.".config/mpd/mpd.conf".text = ''music_directory     "~/Music"
playlist_directory  "~/.config/mpd/playlists"
db_file             "~/.config/mpd/database"
log_file            "~/.config/mpd/log"
log_level           "verbose"
pid_file            "~/.config/mpd/pid"
state_file          "~/.config/mpd/state"
auto_update         "yes"
audio_output {
	type            "pipewire"
	name            "Pipewire sound"
	mixer_type      "software"
}
'';
	
	# thank you haseeb !! https://haseebmajid.dev/posts/2023-10-08-how-to-create-systemd-services-in-nix-home-manager/
	systemd.user.services.mpdscribble = {
    Unit = {
			Description = "MPD Scribble Service";
		};
		Install = {
			WantedBy = [ "mpd.service" ];
		};
    Service = {
      ExecStart = "${pkgs.mpdscribble}/bin/mpdscribble";
      Environment = "HOME=${config.home.homeDirectory}";
      Restart = "on-failure";
    };
  };
}
