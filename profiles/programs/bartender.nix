{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.bartender;

in

{
  options = {
    profile = {
      programs = {
        bartender = {
          enable = mkEnableOption "Bartender" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "bartender"
      ];
    };
  };
}
