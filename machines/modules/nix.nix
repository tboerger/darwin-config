{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    services = {
      nix-daemon = {
        enable = true;
      };
    };
  };
}
