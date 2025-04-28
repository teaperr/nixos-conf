{
  imports = [
    ./xserver.nix
		./docker.nix
		./libratbag.nix
		./pipewire.nix
  ];

	services = {
		libinput = {
			mouse.middleEmulation = false;
		};
		ratbagd.enable = true;
	};
	virtualisation = {
		podman = {
			enable = true;
			dockerCompat = true;
		};
	};
}
