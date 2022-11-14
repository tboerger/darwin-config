{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.utm;

in

{
  options = {
    profile = {
      programs = {
        utm = {
          enable = mkEnableOption "UTM" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "utm"
      ];
    };
  };
}
