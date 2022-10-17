{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    homebrew = {
      enable = true;

      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "zap";
      };
    };
  };
}
