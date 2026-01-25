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
    username = "evelyn";
    homeDirectory = "/home/evelyn";
  };

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        garbage = "nix-store --optimise ; nix-collect-garbage -d ; sudo nix-store --optimise ; sudo nix-collect-garbage -d";
      };
      bashrcExtra = ''
        eval "$(starship init bash)"
      '';
    };
    git = {
      enable = true;
      settings = {
        user = {
          email = "evelyn@partnership.place";
          name = "Evelyn Park";
        };
      };
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
  xdg = {
    configFile = {
      "fastfetch/config.jsonc".source = ../common/fastfetch/config.jsonc;
      "nvim/init.lua".source = ../common/nvim/init.lua;
      "starship/starship.toml".source = ../common/starship/starship.toml;
    };
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}