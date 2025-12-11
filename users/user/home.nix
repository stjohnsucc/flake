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
    username = "user";
    homeDirectory = "/home/user";
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}