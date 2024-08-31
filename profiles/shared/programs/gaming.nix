{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.gaming;

in

{
  options = {
    profile = {
      programs = {
        gaming = {
          enable = mkEnableOption "Gaming";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        packwiz
      ];
    };

    homebrew = {
      taps = [
        "webhippie/webhippie"
        "homebrew/cask-versions"
      ];

      casks = [
        "battle-net"
        "curseforge"
        "multimc"
        "prismlauncher"
        "steam"
        "temurin"
        "temurin8"
      ];

      brews = [
        "mcrcon"
      ];
    };
  };
}
