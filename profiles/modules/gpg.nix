{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.gpg;

in

{
  options = with lib; {
    my = {
      modules = {
        gpg = {
          enable = mkEnableOption ''
            Whether to enable gpg module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          pinentry_mac
        ];
      };

      home-manager.users."${config.my.username}" = { config, ... }: {
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
