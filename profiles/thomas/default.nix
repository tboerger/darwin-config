{ pkgs, inputs, system, lib, ... }:

let
  username = "thomas";
  fullname = "Thomas Boerger";

in

{
  imports = [
    ../modules

    ../programs
    ./programs

    ../services
    ./services
  ];

  profile = {
    username = "${username}";

    modules = {
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
            path = "/Applications/Authy Desktop.app";
          }
          {
            path = "/Applications/1Password 7.app";
          }
          {
            path = "/Applications/LastPass.app";
          }
          {
            path = "/Applications/Rambox.app";
          }
          {
            path = "/Applications/Slack.app";
          }
          {
            path = "/Applications/Mattermost.app";
          }
          {
            path = "/Applications/Microsoft Teams.app";
          }
          {
            path = "/Applications/Discord.app";
          }
          {
            path = "/Applications/Element.app";
          }
          {
            path = "/Applications/Signal.app";
          }
          {
            path = "/Applications/Deezer.app";
          }
          {
            path = "/Users/${username}/Downloads/";
            section = "others";
            options = "--sort dateadded --view grid --display folder";
          }
        ];
      };

      finder = {
        enable = true;

        entries = [
          {
            path = "/Users/${username}";
            alias = "Home";
          }
          {
            path = "/Applications";
            alias = "Applications";
          }
          {
            path = "/Users/${username}/Desktop";
            alias = "Desktop";
          }
          {
            path = "/Users/${username}/Downloads";
            alias = "Downloads";
          }
          {
            path = "/Users/${username}/Developer";
            alias = "Developer";
          }
          {
            path = "/Users/${username}/ownCloud";
            alias = "ownCloud";
          }
        ];
      };
    };
  };

  users = {
    users = {
      "${username}" = {
        description = "${fullname}";
        shell = pkgs.zsh;
        home = "/Users/${username}";
      };
    };
  };

  home-manager.users."${username}" = { config, ... }: {
    home = {
      homeDirectory = "/Users/${username}";
      sessionPath = [ "$HOME/.local/bin" ];

      file = {
        ".local/bin/git-gh-pages" = {
          executable = true;
          source = ./scripts/git-gh-pages.sh;
        };
        ".local/bin/git-promote" = {
          executable = true;
          source = ./scripts/git-promote.sh;
        };
        ".local/bin/search-and-replace" = {
          executable = true;
          source = ./scripts/search-and-replace.sh;
        };

        ".local/bin/each-dir" = {
          executable = true;
          source = ./scripts/each-dir.sh;
        };

        ".local/bin/sort-requirements" = {
          executable = true;
          source = ./scripts/sort-requirements.rb;
        };

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

      stateVersion = "18.09";
    };
  };
}
