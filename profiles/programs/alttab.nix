{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.alttab;

in

{
  options = {
    profile = {
      programs = {
        alttab = {
          enable = mkEnableOption "AltTab" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "alt-tab"
      ];
    };
  };
}
