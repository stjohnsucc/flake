{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    cmatrix
    dosfstools
    fastfetch
    hugo
    lshw
    nodejs
    ntfs3g
    nyancat
    p7zip
    qrencode
    rclone
    unrar
    unzip
    yt-dlp
    zola
  ];

  programs = {
    yazi.enable = true;
  };
}
