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
    ./minio.nix
    ./netrc.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
