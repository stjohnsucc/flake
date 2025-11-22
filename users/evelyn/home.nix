{ config, pkgs, ... }:

{
  home.username = "evelyn";
  home.homeDirectory = "/home/evelyn";

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
  programs = {
    foot = {
      enable = true;
      server.enable = true;
    };
    git = {
      enable = true;
      settings.user = {
        email = "hello@evelynpark.com";
        name = "Evelyn Park";
      };
    };
    starship = {
      enable = true;
    };
    swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
    };
    waybar = {
      enable = true;
      systemd.enable = true;
    };
  };

  services = {
    kanshi.enable = true;
    mako.enable = true;
    swayidle = {
    let
      lock = "${pkgs.swaylock-effects}/bin/swaylock -f --screenshots --effect-blur 7x5";
      display = status: "swaymsg 'output * power ${status}'"; \
    in 
      enable = true;
      timeouts = [
        {
          timeout = 300;
          command = lock;
        }
        {
          timeout = 360;
          command = display "off";
          resumeCommand = display "on";
        }
        {
          timeout = 600;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = (display "off") + "; " + lock;
        }
        {
          event = "after-resume";
          command = display "on";
        }
        {
          event = "lock";
          command = (display "off") + "; " + lock;
        }
        {
          event = "unlock";
          command = display "on";
        }
      ];
    };
    polkit-gnome.enable = true;
  };

  xdg.configFile."fastfetch/config.jsonc".source = ../common/fastfetch/config.jsonc;
  xdg.configFile."foot/foot.ini".source = ../common/foot/foot.ini;
  xdg.configFile."mako/config".source = ../common/mako/config;
  xdg.configFile."mpd/mpd.conf".source = ../common/mpd/mpd.conf;
  xdg.configFile."ncmpcpp/bindings".source = ../common/ncmpcpp/bindings;
  xdg.configFile."ncmpcpp/config".source = ../common/ncmpcpp/config;
  xdg.configFile."nvim/init.lua".source = ../common/nvim/init.lua;
  xdg.configFile."nvim/lua/keymaps.lua".source = ../common/nvim/lua/keymaps.lua;
  xdg.configFile."nvim/lua/options.lua".source = ../common/nvim/lua/options.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = ../common/nvim/lua/plugins.lua;
  xdg.configFile."starship/starship.toml".source = ../common/starship/starship.toml;
  xdg.configFile."sway/config".source = ../common/sway/config;
  xdg.configFile."waybar/config".source = ../common/waybar/config;
  xdg.configFile."waybar/style.css".source = ../common/waybar/style.css;

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
