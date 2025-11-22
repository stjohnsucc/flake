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
      WorkingDirectory = "/home/evelyn/flake-lively";
      User = "evelyn";
      Type = "oneshot";
    };
  };
  
  systemd.services.rebuild = {
    description = "Rebuilds and activates system config";
    restartIfChanged = false;
    path = [pkgs.nixos-rebuild pkgs.systemd];
    script = ''
      nixos-rebuild boot --flake /home/evelyn/flake-lively
      booted="$(readlink /run/booted-system/{initrd,kernel,kernel-modules})"
      built="$(readlink /nix/var/nix/profiles/system/{initrd,kernel,kernel-modules})"
  
      if [ "''${booted}" = "''${built}" ]; then
        nixos-rebuild switch --flake /home/evelyn/flake-lively
      else
        echo "System built but not booted. Manual reboot required."
      fi
    '';
    serviceConfig.Type = "oneshot";
  };
}
