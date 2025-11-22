{ config, lib, pkgs, ... }:

{
  
  imports = 
    [
      ./hardware-configuration.nix
      ../../desktop/plasma.nix
      ../../desktop/plymouth.nix
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

  boot.loader.grub.device = "/dev/disk/by-uuid/0b828703-7727-4203-8274-866a4fa23b18";

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
