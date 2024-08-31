{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.ice;

in

{
  options = {
    profile = {
      programs = {
        ice = {
          enable = mkEnableOption "Ice";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "jordanbaird-ice"
      ];
    };
  };
}
