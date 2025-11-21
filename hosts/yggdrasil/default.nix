{ config, lib, pkgs, ... }:

{
  
  imports = 
    [
      ./hardware-configuration.nix
      ../../desktop/gnome.nix
      ../../modules/network.nix
      ../../modules/system.nix
      ../../modules/editors
      ../../modules/editors/racket.nix
      ../../modules/packages/common
      ../../modules/packages/design/gimp.nix
      ../../modules/packages/design/tenacity.nix
      ../../modules/packages/net
      ../../modules/packages/office
    ];

  networking.hostName = "yggdrasil";

  users = {
    mutableUsers = true;
    users.evelyn = {
      isNormalUser = true;
      description = "Evelyn Park";
      extraGroups = [ "wheel" "networkmanager" ];
      packages = with pkgs; [];
    };
  };

  system.stateVersion = "25.05";

}
