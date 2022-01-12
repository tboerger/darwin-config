{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.minecraft;

in

{
  options = with lib; {
    my = {
      modules = {
        minecraft = {
          enable = mkEnableOption ''
            Whether to enable minecraft module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        taps = [
          "webhippie/webhippie"
          "homebrew/cask-versions"
        ];

        casks = [
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
