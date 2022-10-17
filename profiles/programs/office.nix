{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.office;

in

{
  options = {
    profile = {
      programs = {
        office = {
          enable = mkEnableOption "Office" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "microsoft-office"
      ];
    };
  };
}
