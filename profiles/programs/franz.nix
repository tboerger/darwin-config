{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.franz;

in

{
  options = {
    profile = {
      programs = {
        franz = {
          enable = mkEnableOption "Franz" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "franz"
      ];
    };
  };
}
