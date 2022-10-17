{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.itsycal;

in

{
  options = {
    profile = {
      programs = {
        itsycal = {
          enable = mkEnableOption "Itsycal" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "itsycal"
      ];
    };
  };
}
