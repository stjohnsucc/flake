{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      esbenp.prettier-vscode
      myriad-dreamin.tinymist
      tamasfe.even-better-toml
      vscodevim.vim
    ];
  };
}
