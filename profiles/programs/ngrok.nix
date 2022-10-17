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
          enable = mkEnableOption "Ngrok" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        ngrok
      ];
    };
  };
}
