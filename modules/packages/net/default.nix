{ config, lib, pkgs, ... }:
{
  imports = 
    [
      ./mullvad.nix
      ./qbittorrent.nix
    ];

}
