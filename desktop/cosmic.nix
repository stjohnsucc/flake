{ config, pkgs, ... }:
{
  imports = [
    ./plymouth.nix
  ];
  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
  };
}
