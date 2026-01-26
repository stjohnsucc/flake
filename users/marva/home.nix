{
  pkgs,
  ...
}:

{
  imports = 
    [
      ./dconf.nix
    ];

  home = {
    username = "marva";
    homeDirectory = "/home/marva";
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}