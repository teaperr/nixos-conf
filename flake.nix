{
  description = "thea's nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/master";
    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:FlameFlag/nixcord";
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    lanzaboote.url = "github:nix-community/lanzaboote";
    hyprland.url = "github:hyprwm/Hyprland";
    awww.url = "git+https://codeberg.org/LGFae/awww";
    noctalia.url = "github:noctalia-dev/noctalia";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      nixvim,
      catppuccin,
      nixcord,
      spicetify-nix,
      lanzaboote,
      hyprland,
      noctalia,
      zen-browser,
      ...
    }@inputs:
    {
      nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hyprland.nixosModules.default

          catppuccin.nixosModules.catppuccin
          ./system/configuration.nix
          ./system/cachix.nix
          home-manager.nixosModules.home-manager
          lanzaboote.nixosModules.lanzaboote
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
              inputs.millennium.overlays.default
            ];
          }
        ];
        specialArgs = { inherit inputs; };
      };

      homeConfigurations.lotus = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        modules = [
          {
            home = {
              stateVersion = "24.05";
              username = "lotus";
              homeDirectory = "/home/lotus";
            };
            programs.nixvim.enable = true;
          }
          ./default.nix
          hyprland.homeManagerModules.default
          noctalia.homeModules.default

          catppuccin.homeModules.catppuccin
          nixvim.homeModules.nixvim
          nixcord.homeModules.nixcord
          spicetify-nix.homeManagerModules.spicetify
        ];
        extraSpecialArgs = { inherit inputs; };
      };
    };

}
