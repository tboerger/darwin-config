{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.office;

in

{
  options = with lib; {
    my = {
      modules = {
        office = {
          enable = mkEnableOption ''
            Whether to enable office module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "microsoft-office"
        ];
      };
    };
}
