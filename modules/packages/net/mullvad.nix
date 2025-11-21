{ config, pkgs, ... }:
{
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };
  networking.firewall.checkReversePath = "loose";
}
