{ config, pkgs, ... }:
{
  imports = [
    ./plymouth.nix
  ];
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
