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
          enable = mkEnableOption "Stats";
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
