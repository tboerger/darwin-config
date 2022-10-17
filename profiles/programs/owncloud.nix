{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.owncloud;

in

{
  options = {
    profile = {
      programs = {
        owncloud = {
          enable = mkEnableOption "ownCloud" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "owncloud"
      ];
    };
  };
}
