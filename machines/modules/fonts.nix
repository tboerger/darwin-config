{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.fonts;

in

{
  options = with lib; {
    my = {
      modules = {
        fonts = {
          enable = mkEnableOption ''
            Whether to enable fonts module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      fonts = {
        enableFontDir = true;

        fonts = with pkgs; [
          corefonts
          fira-code
          font-awesome
          roboto
        ];
      };
    };
}
