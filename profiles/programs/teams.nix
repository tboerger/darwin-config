{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.teams;

in

{
  options = {
    profile = {
      programs = {
        teams = {
          enable = mkEnableOption "Teams" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "microsoft-teams"
      ];
    };
  };
}
