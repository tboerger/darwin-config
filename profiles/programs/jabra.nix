{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.jabra;

in

{
  options = {
    profile = {
      programs = {
        jabra = {
          enable = mkEnableOption "Jabra" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      taps = [
        "homebrew/cask-drivers"
      ];

      casks = [
        "jabra-direct"
      ];
    };
  };
}
