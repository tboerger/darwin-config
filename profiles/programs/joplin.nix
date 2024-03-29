{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.joplin;

in

{
  options = {
    profile = {
      programs = {
        joplin = {
          enable = mkEnableOption "Joplin" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "joplin"
      ];
    };
  };
}
