{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.cloud;

in

{
  options = with lib; {
    my = {
      modules = {
        cloud = {
          enable = mkEnableOption ''
            Whether to enable cloud module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          azure-cli
          google-cloud-sdk
        ];
      };

      homebrew = {
        taps = [
          "weaveworks/tap"
        ];

        brews = [
          "awscli"
          "eksctl"
        ];
      };
    };
}
