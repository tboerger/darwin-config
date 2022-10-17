{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.clickup;

in

{
  options = {
    profile = {
      programs = {
        clickup = {
          enable = mkEnableOption "ClickUp" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "clickup"
      ];
    };
  };
}
