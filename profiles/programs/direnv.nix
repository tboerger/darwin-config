{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.direnv;

in
{
  options = {
    profile = {
      programs = {
        direnv = {
          enable = mkEnableOption "Direnv" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        direnv = {
          enable = true;
          enableZshIntegration = true;

          nix-direnv = {
            enable = true;
          };
        };
      };
    };
  };
}
