{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.clockify;

in

{
  options = {
    profile = {
      programs = {
        clockify = {
          enable = mkEnableOption "Clockify" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "clockify"
      ];
    };
  };
}
