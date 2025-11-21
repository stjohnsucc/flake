{ config, lib, pkgs, ... }:
{
  imports = 
    [
      ./browsers.nix
      ./keepass.nix
      ./players.nix
      ./utilities.nix
    ];

}
