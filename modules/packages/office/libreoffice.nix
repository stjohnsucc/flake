{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hunspell
    hunspellDicts.en_US
    libreoffice
  ];
}
