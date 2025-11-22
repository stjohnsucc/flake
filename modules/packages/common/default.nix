{ config, lib, pkgs, ... }:
{
  imports = 
    [
      ./browsers.nix
      ./players.nix
      ./utilities.nix
    ];

}
