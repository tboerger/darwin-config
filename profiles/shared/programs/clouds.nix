{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.clouds;

in

{
  options = {
    profile = {
      programs = {
        clouds = {
          enable = mkEnableOption "Clouds";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        awscli2
        azure-cli
        eksctl
        google-cloud-sdk
        s3cmd
        hcloud
      ];
    };
  };
}
