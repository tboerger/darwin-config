{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.minecraft;

in

{
  options = {
    profile = {
      programs = {
        minecraft = {
          enable = mkEnableOption "Minecraft" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      taps = [
        "webhippie/webhippie"
        "homebrew/cask-versions"
      ];

      casks = [
        "temurin"
        "temurin8"
        "multimc"
        "curseforge"
      ];

      brews = [
        "mcrcon"
      ];
    };
  };
}
