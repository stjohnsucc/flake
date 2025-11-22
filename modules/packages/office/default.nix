{ config, lib, pkgs, ... }:
{
  imports = 
    [
      ./pandoc.nix
      ./texlive.nix
    ];

}
