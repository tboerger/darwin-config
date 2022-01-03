{ config, pkgs, ... }:

{
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-9.4.4"
      ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      alacritty
      authy
      discord
      element-desktop
      etcher
      google-chrome
      hub
      keybase-gui
      lastpass-cli
      lens
      mattermost
      ngrok
      owncloud-client
      rambox
      rocketchat-desktop
      skypeforlinux
      slack
      steam
      tilda
      vscode
      hcloud
      httpie
      ipcalc
      jsonnet
      kubectl
      krew
      minio-client
      nmap
      packer
      pwgen
      shellcheck
      s3cmd
      sops
      stern
      upx
      gimp
      yed
    ];
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  programs = {
    light = {
      enable = true;
    };
  };

  boot = {
    plymouth = {
      enable = true;
    };
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
}
