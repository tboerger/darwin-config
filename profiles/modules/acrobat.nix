{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.acrobat;

in

{
  options = with lib; {
    my = {
      modules = {
        acrobat = {
          enable = mkEnableOption ''
            Whether to enable acrobat module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "adobe-acrobat-reader"
        ];
      };
    };
}
