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
        sudo = "run0";
        garbage = "nix-store --optimise ; nix-collect-garbage -d ; run0 nix-store --optimise ; run0 nix-collect-garbage -d";
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
      "nvim/lua/keymaps.lua".source = ../common/nvim/lua/keymaps.lua;
      "nvim/lua/options.lua".source = ../common/nvim/lua/options.lua;
      "nvim/lua/plugins.lua".source = ../common/nvim/lua/plugins.lua;
      "starship/starship.toml".source = ../common/starship/starship.toml;
    };
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}