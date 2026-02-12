{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, home-manager, ... }@inputs: {
    nixosConfigurations = {
      wsnorth = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wsnorth
          lanzaboote.nixosModules.lanzaboote
          ({ lib, ... }: {
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
              users.user = ./users/user/home.nix;
            };
          }
        ];
      };
      wswest = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wswest
          lanzaboote.nixosModules.lanzaboote
          ({ lib, ... }: {
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
              users.marva = ./users/marva/home.nix;
              users.user = ./users/user/home.nix;
            };
          }
        ];
      };
      wseast = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wseast
          lanzaboote.nixosModules.lanzaboote
          ({ lib, ... }: {
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
              users.user = ./users/user/home.nix;
            };
          }
        ];
      };
      wscentral = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wscentral
          lanzaboote.nixosModules.lanzaboote
          ({ lib, ... }: {
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
              users.user = ./users/user/home.nix;
            };
          }
        ];
      };
    };
  };
}
