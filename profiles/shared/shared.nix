{ pkgs, lib, config, ... }:

let
  cfg = config.my.modules.shared;

in

{
  options = with lib; {
    my = {
      modules = {
        shared = {
          enable = mkEnableOption ''
            Whether to enable shared module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable { };
}
