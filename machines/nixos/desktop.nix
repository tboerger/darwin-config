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
        cpuFreqGovernor = lib.mkDefault "powersave";

        powertop = {
          enable = false;
        };
      };

      # nixpkgs = {
      #   config = {
      #     permittedInsecurePackages = [
      #       "electron-9.4.4"
      #     ];
      #   };
      # };

      environment = {
        systemPackages = with pkgs; [
          alacritty
          ansible
          authy
          discord
          element-desktop
          etcher
          google-chrome
          hcloud
          httpie
          hub
          ipcalc
          jsonnet
          krew
          kubectl
          lastpass-cli
          lens
          mattermost
          minio-client
          ngrok
          nmap
          owncloud-client
          packer
          pwgen
          rambox
          rocketchat-desktop
          s3cmd
          shellcheck
          skypeforlinux
          slack
          sops
          stern
          upx
          vscode
          yed
        ];
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
