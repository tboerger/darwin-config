{ pkgs, lib, config, options, ... }:
with lib;

let
  username = "thomas";
  homeDirectory = "/Users/thomas";

in
{
  imports = [
    ../shared/modules
    ../shared/global

    ../shared/programs
    ./programs

    ../shared/services
    ./services
  ];

  profile = {
    programs = {
      # act = {
      #   enable = true;
      # };
      # alfred = {
      #   enable = true;
      # };
      # alttab = {
      #   enable = true;
      # };
      # appcleaner = {
      #   enable = true;
      # };
      # browser = {
      #   enable = true;
      # };
      # chat = {
      #   enable = true;
      # };
      # clouds = {
      #   enable = true;
      # };
      # develop = {
      #   enable = true;
      # };
      # docker = {
      #   enable = true;
      # };
      # etcher = {
      #   enable = true;
      # };
      # gaming = {
      #   enable = true;
      # };
      # gnupg = {
      #   enable = true;
      # };
      # golang = {
      #   enable = true;
      # };
      # graphics = {
      #   enable = true;
      # };
      # hammerspoon = {
      #   enable = true;
      # };
      # ice = {
      #   enable = true;
      # };
      # itsycal = {
      #   enable = true;
      # };
      # joplin = {
      #   enable = true;
      # };
      # kube = {
      #   enable = true;
      # };
      # kya = {
      #   enable = true;
      # };
      # macdown = {
      #   enable = true;
      # };
      # music = {
      #   enable = true;
      # };
      # nextcloud = {
      #   enable = true;
      # };
      # ngrok = {
      #   enable = true;
      # };
      # office = {
      #   enable = true;
      # };
      # onlyswitch = {
      #   enable = true;
      # };
      # password = {
      #   enable = true;
      # };
      # rectangle = {
      #   enable = true;
      # };
      # stats = {
      #   enable = true;
      # };
      # streaming = {
      #   enable = true;
      # };
      # terminal = {
      #   enable = true;
      # };
      # utm = {
      #   enable = true;
      # };
      # work = {
      #   enable = true;
      # };
      # yubikey = {
      #   enable = true;
      # };

      dock = {
        enable = true;

        entries = [
          {
            path = "/System/Applications/Launchpad.app";
          }
          {
            path = "/Applications/iTerm.app";
          }
          {
            path = "/Applications/Google Chrome.app";
          }
          {
            path = "/System/Applications/Mail.app";
          }
          {
            path = "${pkgs.vscode}/Applications/Visual Studio Code.app";
          }
          {
            path = "/Applications/ClickUp.app";
          }
          {
            path = "/Applications/1Password 8.app";
          }
          {
            path = "/Applications/Microsoft Teams.app";
          }
          {
            path = "/Applications/Slack.app";
          }
          {
            path = "/Applications/Discord.app";
          }
          {
            path = "/Applications/Element.app";
          }
          {
            path = "/Applications/Skype.app";
          }
          {
            path = "/Applications/Signal.app";
          }
          {
            path = "/Applications/WhatsApp.app";
          }
          {
            path = "/Applications/Telegram.app";
          }
          {
            path = "/Applications/Deezer.app";
          }
          {
            path = "${homeDirectory}/Downloads/";
            section = "others";
            options = "--sort dateadded --view grid --display folder";
          }
        ];
      };

      finder = {
        enable = true;

        entries = [
          {
            path = "${homeDirectory}";
            alias = "Home";
          }
          {
            path = "/Applications";
            alias = "Applications";
          }
          {
            path = "${homeDirectory}/Desktop";
            alias = "Desktop";
          }
          {
            path = "${homeDirectory}/Downloads";
            alias = "Downloads";
          }
          {
            path = "${homeDirectory}/Developer";
            alias = "Developer";
          }
          {
            path = "${homeDirectory}/Nextcloud";
            alias = "Nextcloud";
          }
        ];
      };
    };
  };

  home = {
    inherit username homeDirectory;
    sessionPath = [ "$HOME/.local/bin" ];

    sessionVariables = {
      LC_ALL = "en_US.UTF-8";
    };

    file = {
      ".wallpapers/dark.jpg" = {
        source = ./wallpapers/dark.jpg;
      };
      ".wallpapers/light.jpg" = {
        source = ./wallpapers/light.jpg;
      };
      ".wallpapers/tower.jpg" = {
        source = ./wallpapers/tower.jpg;
      };
    };

    stateVersion = "23.11";
  };
}
