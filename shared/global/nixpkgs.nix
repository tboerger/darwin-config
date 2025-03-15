{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

{
  config = {
    nixpkgs = {
      config = {
        allowUnfree = true;
      };

      overlays = [
        (import ../../overlays)
      ];
    };
  };
}
