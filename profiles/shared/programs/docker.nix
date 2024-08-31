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
          enable = mkEnableOption "Docker";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        lazydocker
      ];
    };

    homebrew = {
      casks = [
        "docker"
      ];
    };
  };
}
