{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.gpg;

in
{
  options = {
    profile = {
      programs = {
        gpg = {
          enable = mkEnableOption "GnuPG" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        pinentry_mac
      ];
    };

    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        gpg = {
          enable = true;
        };
      };
    };

    programs = {
      gnupg = {
        agent = {
          enable = true;
          enableSSHSupport = true;
        };
      };
    };
  };
}
