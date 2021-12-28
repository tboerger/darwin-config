{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      autorun = true;
      layout = "de";
      xkbOptions = "eurosign:e";

      libinput = {
        enable = true;

        touchpad = {
          disableWhileTyping = false;
          tapping = true;
          tappingDragLock = false;
          middleEmulation = true;
          naturalScrolling = true;
          scrollMethod = "twofinger";
        };
      };

      desktopManager = {
        xterm = {
          enable = false;
        };
      };

      displayManager = {
        defaultSession = "none+i3";

        lightdm = {
          enable = true;
        };
      };

      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          configFile = ../configs/i3.conf;

          extraPackages = with pkgs; [
            lxappearance
            scrot
            playerctl
          ];
        };
      };
    };
  };

  programs = {
    dconf = {
      enable = true;
    };
  };
}
