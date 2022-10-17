{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.golang;

in
{
  options = {
    profile = {
      programs = {
        golang = {
          enable = mkEnableOption "Golang" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users."${config.profile.username}" = { config, ... }: {
      home = {
        sessionPath = [ "$HOME/Golang/bin" ];
      };

      programs = {
        go = {
          enable = true;
          package = pkgs.go_1_19;
          goPath = "Golang";
          goBin = "Golang/bin";
        };
      };
    };
  };
}
