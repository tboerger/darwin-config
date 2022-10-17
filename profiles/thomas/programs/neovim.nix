{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.neovim;

in
{
  options = {
    profile = {
      programs = {
        neovim = {
          enable = mkEnableOption "Neovim" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        neovim = {
          enable = true;
        };
      };
    };
  };
}
