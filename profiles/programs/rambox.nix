{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.rambox;

in

{
  options = {
    profile = {
      programs = {
        rambox = {
          enable = mkEnableOption "Rambox" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "rambox"
      ];
    };
  };
}
