{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        esbenp.prettier-vscode
        james-yu.latex-workshop
        jdinhlife.gruvbox
        tamasfe.even-better-toml
        vscodevim.vim
      ];
    })
  ];
}
