{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.onlyswitch;

in

{
  options = {
    profile = {
      programs = {
        onlyswitch = {
          enable = mkEnableOption "OnlySwitch" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "only-switch"
      ];
    };
  };
}
