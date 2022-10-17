{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.docker;

in

{
  options = {
    profile = {
      programs = {
        docker = {
          enable = mkEnableOption "Docker" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "docker"
      ];
    };
  };
}
