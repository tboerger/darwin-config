{ pkgs, lib, config, ... }:

let
  cfg = config.my.modules.minecraft;

in

{
  options = with lib; {
    my = {
      modules = {
        minecraft = {
          enable = mkEnableOption ''
            Whether to enable minecraft module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable ({
      environment = {
        systemPackages = with pkgs; [
          adoptopenjdk-hotspot-bin-8
          mcrcon
          multimc
        ];
      };
    });
}
