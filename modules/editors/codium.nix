{ ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      esbenp.prettier-vscode
      james-yu.latex-workshop
      jdinhlife.gruvbox
      tamasfe.even-better-toml
      vscodevim.vim
    ];
  };
}
