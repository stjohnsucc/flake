{ config, lib, pkgs, ... }:

{
  
  imports = 
    [
      ./hardware-configuration.nix
      ../../desktop/plasma.nix
      ../../desktop/plymouth.nix
      ../../desktop/tuigreet.nix
      ../../modules/network.nix
      ../../modules/system.nix
      ../../modules/editors
      ../../modules/packages/common
      ../../modules/packages/design/gimp.nix
      ../../modules/packages/design/tenacity.nix
      ../../modules/packages/net
      ../../modules/packages/office
    ];

  networking.hostName = "wsnorth";

  users = {
    users.admin = {
      isNormalUser = true;
      description = "Administrator";
      extraGroups = [ "wheel" "networkmanager" ];
      packages = with pkgs; [];
    };
    users.evelyn = {
      isNormalUser = true;
      description = "Evelyn Park";
      extraGroups = [ "networkmanager" ];
      packages = with pkgs; [];
    };
  };

  system.stateVersion = "25.05";

}
