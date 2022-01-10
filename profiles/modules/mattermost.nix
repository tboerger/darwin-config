{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.mattermost;

in

{
  options = with lib; {
    my = {
      modules = {
        mattermost = {
          enable = mkEnableOption ''
            Whether to enable mattermost module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          mattermost-desktop
        ];
      };
    };
}
