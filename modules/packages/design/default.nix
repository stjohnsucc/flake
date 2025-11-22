{ config, lib, pkgs, ... }:
{
  imports = 
    [
      ./gimp.nix
      ./kdenlive.nix
      ./obs.nix
      ./tenacity.nix
    ];

}
