{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.lsd;

in
{
  options = {
    profile = {
      programs = {
        lsd = {
          enable = mkEnableOption "Lsd" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        lsd = {
          enable = true;
          enableAliases = true;
        };
      };
    };
  };
}
