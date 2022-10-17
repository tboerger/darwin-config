{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.istatmenus;

in

{
  options = {
    profile = {
      programs = {
        istatmenus = {
          enable = mkEnableOption "iStatMenus" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "istat-menus"
      ];
    };
  };
}
