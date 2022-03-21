{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.rambox;

in

{
  options = with lib; {
    my = {
      modules = {
        rambox = {
          enable = mkEnableOption ''
            Whether to enable rambox module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "rambox"
        ];
      };
    };
}
