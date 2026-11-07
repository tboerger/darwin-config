{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  imports = [
    ./copilot.nix
    ./git.nix
    ./github.nix
    ./netrc.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
