{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./libvirt.nix
    ./i3wm.nix
    ./desktop.nix
  ];

  my = {
    modules = {
      docker = {
        enable = true;
      };

      libvirt = {
        enable = true;
      };

      i3wm = {
        enable = true;
      };

      desktop = {
        enable = true;
      };
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;

    loader = {
      efi = {
        canTouchEfiVariables = true;
      };

      systemd-boot = {
        enable = true;
        consoleMode = "2";
        editor = false;
      };
    };
  };

  powerManagement = {
    cpuFreqGovernor = lib.mkDefault "powersave";
  };

  services = {
    timesyncd = {
      enable = true;
    };

    haveged = {
      enable = true;
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
}
