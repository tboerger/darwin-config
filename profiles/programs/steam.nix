{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.steam;

in

{
  options = {
    profile = {
      programs = {
        steam = {
          enable = mkEnableOption "Steam" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "steam"
      ];
    };
  };
}
