{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.fzf;

in
{
  options = {
    profile = {
      programs = {
        fzf = {
          enable = mkEnableOption "Fzf" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        fzf = {
          enable = true;
          enableZshIntegration = true;
        };
      };
    };
  };
}
