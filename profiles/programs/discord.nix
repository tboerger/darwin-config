{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.discord;

in

{
  options = {
    profile = {
      programs = {
        discord = {
          enable = mkEnableOption "Discord" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "discord"
      ];
    };
  };
}
