{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./git.nix
    ./golang.nix
    ./macos.nix
    ./neovim.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
