{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    withPython3 = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };
  environment.systemPackages = with pkgs; [
    lua51Packages.lua
    lua51Packages.luarocks
  ];
}
