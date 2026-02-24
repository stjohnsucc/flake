# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "phinger-cursors-dark";
      enable-hot-corners = false;
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Yaru-blue-dark";
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [];
      switch-applications-backward = [];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };

    "org/gnome/shell" = {
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "dash-to-dock@micxgx.gmail.com" ];
      favorite-apps = [ "google-chrome.desktop" "org.gnome.Ptyxis.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      custom-theme-shrink = true;
      disable-overview-on-startup = true;
    };
  };
}
