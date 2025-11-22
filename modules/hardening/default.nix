{ config, lib, ... }:
{
  imports = [
    ./dbus-broker.nix
    ./kernel-params.nix
    ./malloc.nix
    ./nosuid.nix
    ./services.nix
    ./sysctl.nix
  ];
}
