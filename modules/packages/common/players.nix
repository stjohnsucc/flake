{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (ncmpcpp.override {
      visualizerSupport = true;
    })
    mpd
    mpv
  ];
}
