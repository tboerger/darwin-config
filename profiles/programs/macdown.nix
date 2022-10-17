{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.macdown;

in

{
  options = {
    profile = {
      programs = {
        macdown = {
          enable = mkEnableOption "Macdown" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "macdown"
      ];
    };
  };
}
