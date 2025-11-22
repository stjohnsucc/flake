{ config, pkgs, ... }:
{
  imports = [
    ./plymouth.nix
  ];
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  programs.gnome-terminal.enable = true;
  environment.systemPackages = with pkgs; [
    adw-gtk3
    dconf-editor
    gnome-tweaks
    phinger-cursors
    yaru-theme
  ];
  environment.gnome.excludePackages = with pkgs; [
    epiphany
  ];
}
