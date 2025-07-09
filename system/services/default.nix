{
  imports = [
    ./xserver.nix
		./docker.nix
		./libratbag.nix
		./pipewire.nix
  ];

	services = {
		logmein-hamachi.enable = true;

		libinput = {
			mouse.middleEmulation = false;
		};
		ratbagd.enable = true;

		dnsmasq = {
			enable = false;
			settings = {
				"enable-tftp" = true;
				"tftp-root" = "/tftpboot";
				"bind-interfaces" = true;
			};
		};
	};
	virtualisation = {
		podman = {
			enable = true;
			dockerCompat = true;
		};
	};
}
