{
  description = "thea's nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    nixvim.url = "github:nix-community/nixvim";
    catppuccin.url = "github:catppuccin/nix";
		nix-ld = {
			url = "github:Mic92/nix-ld";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = { self, nixpkgs, home-manager, nixvim, catppuccin, nix-ld, ... }: {
    nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        catppuccin.nixosModules.catppuccin
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
				nix-ld.nixosModules.nix-ld
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
        catppuccin.homeManagerModules.catppuccin
        nixvim.homeManagerModules.nixvim
      ];
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    };
  };
}

