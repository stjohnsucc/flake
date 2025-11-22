{ config, lib, pkgs, ... }:
{
  systemd.services.pull-updates = {
    description = "Pulls changes to system config";
    restartIfChanged = false;
    onSuccess = [ "rebuild.service" ];
    startAt = "04:40";
    path = [pkgs.git pkgs.openssh];
    script = ''
      test "$(git branch --show-current)" = "main"
      git pull --ff-only
    '';
    serviceConfig = {
      WorkingDirectory = "/home/admin/flake";
      User = "admin";
      Type = "oneshot";
    };
  };
  
  systemd.services.rebuild = {
    description = "Rebuilds and activates system config";
    restartIfChanged = false;
    path = [pkgs.nixos-rebuild pkgs.systemd];
    script = ''
      nixos-rebuild boot --flake /home/admin/flake
      booted="$(readlink /run/booted-system/{initrd,kernel,kernel-modules})"
      built="$(readlink /nix/var/nix/profiles/system/{initrd,kernel,kernel-modules})"
  
      if [ "''${booted}" = "''${built}" ]; then
        nixos-rebuild switch --flake /home/admin/flake
      else
        echo "System built but not booted. Manual reboot required."
      fi
    '';
    serviceConfig.Type = "oneshot";
  };
}
