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
    loader = {
      systemd-boot.enable = true;
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
    printing = {
      enable = true;
      drivers = with pkgs; [ epson-escpr epson-escpr2 gutenprint hplip splix ];
      openFirewall = true;
      listenAddresses = [ "*:631" ];
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
  };
  hardware.printers = {
    ensurePrinters = [
      {
        name = "EPSON_WF-C869R_Series";
        description = "EPSON_WF-C869R_Series";
        location = "Home";
        deviceUri = "dnssd://EPSON%20WF-C869R%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-f8d0272737f5";
        model = "epson-inkjet-printer-escpr2/Epson-WF-C869R_Series-epson-escpr2-en.ppd";
        ppdOptions = {
          PageSize = "Letter";
          ColorModel = "Gray";
        };
      }
    ];
    ensureDefaultPrinter = "EPSON_WF-C869R_Series";
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
