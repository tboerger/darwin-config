{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.ngrok;

in

{
  options = with lib; {
    my = {
      modules = {
        ngrok = {
          enable = mkEnableOption ''
            Whether to enable ngrok module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          ngrok
        ];
      };
    };
}
