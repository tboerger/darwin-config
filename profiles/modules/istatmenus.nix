{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.istatmenus;

in

{
  options = with lib; {
    my = {
      modules = {
        istatmenus = {
          enable = mkEnableOption ''
            Whether to enable istatmenus module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "istat-menus"
        ];
      };
    };
}
