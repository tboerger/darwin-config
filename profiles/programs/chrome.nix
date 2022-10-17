{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.chrome;

in

{
  options = {
    profile = {
      programs = {
        chrome = {
          enable = mkEnableOption "Chrome" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "google-chrome"
      ];
    };
  };
}
