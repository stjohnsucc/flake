{ config, pkgs, ... }:
{
  imports = [
    ./plymouth.nix
  ];
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    flatpak.packages = [
      "org.gtk.Gtk3theme.adw-gtk3-dark"
    ];
  };
  environment.systemPackages = with pkgs; [
    adw-gtk3
    dconf-editor
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    phinger-cursors
    ptyxis
    yaru-theme
  ];
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-console
  ];
}
