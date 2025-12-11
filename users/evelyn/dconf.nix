# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/Ptyxis" = {
      audible-bell = false;
      default-columns = mkUint32 120;
      default-profile-uuid = "e29d8a2a7f3956c6729ce526692fe833";
      default-rows = mkUint32 36;
      font-name = "MesloLGS NF 12";
      interface-style = "dark";
      profile-uuids = [ "e29d8a2a7f3956c6729ce526692fe833" ];
      restore-session = false;
      restore-window-size = false;
      use-system-font = false;
      window-size = mkTuple [ (mkUint32 120) (mkUint32 36) ];
    };

    "org/gnome/Ptyxis/Profiles/e29d8a2a7f3956c6729ce526692fe833" = {
      palette = "gnome";
      preserve-directory = "never";
    };

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
      favorite-apps = [ "google-chrome.desktop" "org.gnome.Ptyxis.desktop" "org.gnome.Nautilus.desktop" "codium.desktop" ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      custom-theme-shrink = true;
      disable-overview-on-startup = true;
    };

  };
}
