{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  imports = [
    ./git.nix
    ./github.nix
    ./minio.nix
    ./netrc.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
