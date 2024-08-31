{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.nextcloud;

in

{
  options = {
    profile = {
      programs = {
        nextcloud = {
          enable = mkEnableOption "Nextcloud";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "nextcloud"
      ];
    };
  };
}
