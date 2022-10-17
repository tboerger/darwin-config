{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.deezer;

in

{
  options = {
    profile = {
      programs = {
        deezer = {
          enable = mkEnableOption "Deezer" // {
            default = true;
          };
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
