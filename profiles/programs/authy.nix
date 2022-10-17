{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.authy;

in

{
  options = {
    profile = {
      programs = {
        authy = {
          enable = mkEnableOption "Authy" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "authy"
      ];
    };
  };
}
