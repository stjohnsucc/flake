{ config, lib, pkgs, ... }:

{
  
  imports = 
    [
      ./hardware-configuration.nix
      ../../desktop/gnome.nix
      ../../modules/network.nix
      ../../modules/system.nix
      ../../modules/editors
      ../../modules/packages/common
      ../../modules/packages/design
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
      extraGroups = [ "wheel" "networkmanager" ];
      packages = with pkgs; [];
    };
  };

  system.stateVersion = "25.11";

}
