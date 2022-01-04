{ pkgs, lib, config, ... }:

let
  cfg = config.my.modules.desktop;

in

{
  options = with lib; {
    my = {
      modules = {
        desktop = {
          enable = mkEnableOption ''
            Whether to enable desktop module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      boot = {
        plymouth = {
          enable = true;
        };
      };

      console = {
        font = "Lat2-Terminus16";
        keyMap = "de";
      };

      hardware = {
        opengl = {
          enable = true;
        };

        bluetooth = {
          enable = true;
          package = pkgs.bluezFull;
        };

        pulseaudio = {
          enable = true;
          package = pkgs.pulseaudioFull;
        };
      };

      sound = {
        enable = true;

        mediaKeys = {
          enable = true;
        };
      };

      powerManagement = {
        enable = true;

        powertop = {
          enable = false;
        };
      };

      services = {
        avahi = {
          enable = true;
          nssmdns = true;
        };

        light = {
          enable = true;
        };

        fstrim = {
          enable = true;
        };

        tlp = {
          enable = true;
        };

        fwupd = {
          enable = true;
        };

        thermald = {
          enable = true;
        };

        printing = {
          enable = true;
        };

        blueman = {
          enable = true;
        };

        logind = {
          lidSwitch = "suspend";
          extraConfig = "IdleAction=lock";
        };
      };
    };
}
