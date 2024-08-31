{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.ngrok;

in

{
  options = {
    profile = {
      programs = {
        ngrok = {
          enable = mkEnableOption "Ngrok";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        ngrok
      ];
    };
  };
}
