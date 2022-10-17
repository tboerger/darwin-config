{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.element;

in

{
  options = {
    profile = {
      programs = {
        element = {
          enable = mkEnableOption "Element" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "element"
      ];
    };
  };
}
