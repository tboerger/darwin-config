{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

let
  cfg = config.profile.programs.minio;

in
{
  options = {
    profile = {
      programs = {
        minio = {
          enable = mkEnableOption "Minio" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        minio-client
      ];
    };

    age = {
      secrets = {
        minio = {
          file = ../secrets/minio.age;
          path = "${config.home.homeDirectory}/.mc/config.json";
          mode = "0600";
        };
      };
    };
  };
}
