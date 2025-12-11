{ ... }:
{
  environment.extraInit = "umask 0077";
  services = {
    # accounts-daemon.enable = false;
    #avahi.enable = false;
    chrony = {
      enable = true;
      enableNTS = true;
      servers = [
        "time.cloudflare.com"
        "ntppool1.time.nl"
        "nts.netnod.se"
        "ptbtime1.ptb.de"
        "time.dfm.dk"
        "time.cifelli.xyz"
      ];
    };
  };
  networking.modemmanager.enable = false;
  systemd.coredump.enable = false;
  security.pam.loginLimits = [
    {
      domain = "*"; # Applies to all users/sessions
      type = "-"; # Set both soft and hard limits
      item = "core"; # The soft/hard limit item
      value = "0";   # Core dumps size is limited to 0 (effectively disabled)
    }
  ];
}

