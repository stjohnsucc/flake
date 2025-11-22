{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, home-manager, ... }@inputs: {
    nixosConfigurations.yggdrasil = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/yggdrasil
        lanzaboote.nixosModules.lanzaboote
        ({ pkgs, lib, ... }: {
          boot.loader.systemd-boot.enable = lib.mkForce false;
          boot.lanzaboote = {
            enable = true;
            pkiBundle = "/var/lib/sbctl";
          };
        })
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.evelyn = ./users/evelyn/home.nix;
          };
        }
      ];
    };
  };
}
