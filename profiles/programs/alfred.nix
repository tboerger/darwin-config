{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.alfred;

in

{
  options = {
    profile = {
      programs = {
        alfred = {
          enable = mkEnableOption "Alfred" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "alfred"
      ];
    };
  };
}
