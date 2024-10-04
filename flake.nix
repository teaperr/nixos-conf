{
  description = "Arch Linux flake with Home Manager managing Neovim via Nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05"; # Use the corresponding branch for your NixOS version
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    nixvim.url = "github:nix-community/nixvim/nixos-24.05"; # Match the version with nixpkgs
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, nixvim, catppuccin, ... }: {
    nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";  # Adjust if you're using a different architecture
      modules = [
        catppuccin.nixosModules.catppuccin  # Fix typo here
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };
    homeConfigurations.lotus = home-manager.lib.homeManagerConfiguration {
      modules = [
	{
	  home = {
	    stateVersion = "24.05";
	    username = "lotus";
	    homeDirectory = "/home/lotus";
	  };
          programs.nixvim.enable = true;
	}
        ./home-manager/default.nix
        catppuccin.homeManagerModules.catppuccin  # Fix typo here
        nixvim.homeManagerModules.nixvim
      ];
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    };
  };
}

