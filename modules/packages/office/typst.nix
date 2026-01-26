{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    typst
  ];
  services.flatpak.packages = [
    "net.trowell.typesetter"
  ];
}
