{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    cmatrix
    dosfstools
    fastfetch
    go
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

  services.flatpak.packages = [
    "com.belmoussaoui.Authenticator"
  ];

  programs = {
    yazi.enable = true;
  };
}
