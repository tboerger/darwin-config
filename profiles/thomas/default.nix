{
  pkgs,
  lib,
  config,
  options,
  ...
}:
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
      act = {
        enable = true;
      };
      clouds = {
        enable = true;
      };
      develop = {
        enable = true;
      };
      gnupg = {
        enable = true;
      };
      golang = {
        enable = true;
      };
      hammerspoon = {
        enable = true;
      };
      kube = {
        enable = true;
      };
      ngrok = {
        enable = false;
      };

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
            path = "/Users/thomas/Applications/Home Manager Apps/Visual Studio Code.app";
          }
          {
            path = "/Applications/ClickUp.app";
          }
          {
            path = "/Applications/1Password.app";
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
            path = "/Applications/Signal.app";
          }
          {
            path = "/Applications/Ferdium.app";
          }
          {
            path = "/Applications/Spotify.app";
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
