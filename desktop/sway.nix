{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      adw-gtk3
      autotiling-rs
      brightnessctl
      foot
      grim
      imv
      kanshi
      mako
      nwg-look
      pcmanfm
      phinger-cursors
      rofi
      rofi-power-menu
      slurp
      sway-contrib.inactive-windows-transparency
      swayidle
      swaylock-effects
      waybar
      wl-clipboard
      yaru-theme
      zathura
    ];
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      NIXOS_OZONE_WL = "1";
    };
  };

  programs = {
    sway = {
      enable = true;
      xwayland.enable = false;
      wrapperFeatures.gtk = true;
    };
    seahorse.enable = true;
  };

  services = {
    gvfs.enable = true;
  };

  systemd.user.services = {
    pipewire.enable = true;
    pipewire-pulse.enable = true;
    kanshi = {
      description = "kanshi daemon";
      serviceConfig = {
        Type = "simple";
        ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
      };
      enable = true;
    };
    xdg-desktop-portal-wlr = {
      enable = false;
    };
  };

  security.pam.services = {
    evelyn.enableGnomeKeyring = true;
  };

}
