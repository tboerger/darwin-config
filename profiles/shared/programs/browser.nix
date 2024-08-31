{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.browser;

in

{
  options = {
    profile = {
      programs = {
        browser = {
          enable = mkEnableOption "Browser";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "google-chrome"
        "firefox"
      ];
    };
  };
}
