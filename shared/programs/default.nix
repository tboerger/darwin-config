{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./bash.nix
    ./brews.nix
    ./gnupg.nix
    ./zsh.nix
  ];
}
