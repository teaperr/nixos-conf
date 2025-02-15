{
  imports = [
    ./xserver.nix
		./docker.nix
  ];

	services = {
		ratbagd.enable = true;
	};
}
