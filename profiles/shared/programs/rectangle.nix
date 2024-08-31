{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.rectangle;

in

{
  options = {
    profile = {
      programs = {
        rectangle = {
          enable = mkEnableOption "Rectangle";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "rectangle"
      ];
    };
  };
}
