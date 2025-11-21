{ config, lib, pkgs, ... }:
{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  boot = {
    initrd = {
      systemd.enable = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
    };
  };
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024; # 16 GB
  }];
  time.timeZone = "America/Detroit";
  fonts.packages = with pkgs; [
    corefonts
    meslo-lgs-nf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    source-sans
    source-serif
    vista-fonts
  ];
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh = {
      enable = true;
      openFirewall = true;
    };
  };
  security.rtkit.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    sbctl
  ];
}
