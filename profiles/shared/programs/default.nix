{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./act.nix
    ./clouds.nix
    ./develop.nix
    ./gnupg.nix
    ./golang.nix
    ./hammerspoon.nix
    ./kube.nix
    ./ngrok.nix
  ];

  options = with lib; {
    profile = {
      programs = { };
    };
  };
}
