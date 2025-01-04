{
  imports = [
    ./xserver.nix
  ];

	services = {
		ratbagd.enable = true;
	};
}
