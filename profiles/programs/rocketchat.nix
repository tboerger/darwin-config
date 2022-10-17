{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.rocketchat;

in

{
  options = {
    profile = {
      programs = {
        rocketchat = {
          enable = mkEnableOption "Rocket.Chat" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "rocket-chat"
      ];
    };
  };
}
