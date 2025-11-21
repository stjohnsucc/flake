{ config, lib, ... }:
{
  security = {
    sudo.enable = false;
    wrappers = {
      su.setuid = lib.mkForce false;
      sg.setuid = lib.mkForce false;
      fusermount.setuid = lib.mkForce false;
      fusermount3.setuid = lib.mkForce false;
      mount.setuid = lib.mkForce false;
      pkexec.setuid = lib.mkForce false;
      newgrp.setuid = lib.mkForce false;
      newgidmap.setuid = lib.mkForce false;
      newuidmap.setuid= lib.mkForce false;
    };
  };
}
