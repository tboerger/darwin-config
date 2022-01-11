{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.homebrew;

in

{
  options = with lib; {
    my = {
      modules = {
        homebrew = {
          enable = mkEnableOption ''
            Whether to enable homebrew module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        enable = true;
        autoUpdate = true;
        cleanup = "zap";
      };
    };
}
