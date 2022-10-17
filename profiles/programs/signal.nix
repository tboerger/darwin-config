{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.signal;

in

{
  options = {
    profile = {
      programs = {
        signal = {
          enable = mkEnableOption "Signal" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "signal"
      ];
    };
  };
}
