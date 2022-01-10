{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.clickup;

in

{
  options = with lib; {
    my = {
      modules = {
        clickup = {
          enable = mkEnableOption ''
            Whether to enable clickup module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          clickup
        ];
      };
    };
}
