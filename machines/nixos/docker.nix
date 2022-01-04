{ pkgs, lib, config, ... }:

let
  cfg = config.my.modules.docker;

in

{
  options = with lib; {
    my = {
      modules = {
        docker = {
          enable = mkEnableOption ''
            Whether to enable docker module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      virtualisation = {
        docker = {
          enable = true;

          autoPrune = {
            enable = true;
            dates = "weekly";
          };
        };
      };
    };
}
