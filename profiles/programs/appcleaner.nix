{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.appcleaner;

in

{
  options = {
    profile = {
      programs = {
        appcleaner = {
          enable = mkEnableOption "AppCleaner" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "appcleaner"
      ];
    };
  };
}
