{ ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.kdenlive
  ];
}
