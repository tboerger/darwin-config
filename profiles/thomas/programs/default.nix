{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./git.nix
    ./github.nix
    ./gopass.nix
    ./macos.nix
    ./minio.nix
    ./netrc.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
