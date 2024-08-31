{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./bash.nix
    ./gnupg.nix
    ./zsh.nix
  ];
}
