{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.readline;

in
{
  options = {
    profile = {
      programs = {
        readline = {
          enable = mkEnableOption "Readline" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        readline = {
          enable = true;

          bindings = {
            "\e[5~" = "history-search-backward";
            "\e[6~" = "history-search-forward";
          };
        };
      };
    };
  };
}
