{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.cloud;

in

{
  options = {
    profile = {
      programs = {
        cloud = {
          enable = mkEnableOption "Cloud" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
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
