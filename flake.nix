{
  description = "NixOS configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin }: {
    nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";  # Adjust if you're using a different architecture
      modules = [
        catppuccin.nixosModules.catppuccin  # Fix typo here
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };

    # Home Manager configuration
    homeConfigurations.lotus = home-manager.lib.homeManagerConfiguration {
      modules = [
        ./home-manager/home.nix
        catppuccin.homeManagerModules.catppuccin  # Fix typo here
      ];
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    };
  };
}

