{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.work;

in

{
  options = {
    profile = {
      programs = {
        work = {
          enable = mkEnableOption "Work";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "citrix-workspace"
        "clickup"
        "clockify"
      ];
    };
  };
}
