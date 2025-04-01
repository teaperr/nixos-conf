{
  imports = [
    ./xserver.nix
		./docker.nix
  ];

	services = {
		libinput = {
			mouse.middleEmulation = false;
		}
		ratbagd.enable = true;
	};
}
