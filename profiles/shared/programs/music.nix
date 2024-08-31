{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.music;

in

{
  options = {
    profile = {
      programs = {
        music = {
          enable = mkEnableOption "Music";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "deezer"
      ];
    };
  };
}
