{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.stats;

in

{
  options = {
    profile = {
      programs = {
        stats = {
          enable = mkEnableOption "Stats" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "stats"
      ];
    };
  };
}
