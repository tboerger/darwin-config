{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.mattermost;

in

{
  options = {
    profile = {
      programs = {
        mattermost = {
          enable = mkEnableOption "Mattermost" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "mattermost"
      ];
    };
  };
}
