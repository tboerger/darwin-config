{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.slack;

in

{
  options = {
    profile = {
      programs = {
        slack = {
          enable = mkEnableOption "Slack" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "slack"
      ];
    };
  };
}
