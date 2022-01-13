{ pkgs, inputs, system, lib, ... }:

let
  username = "thomas";
  fullname = "Thomas Boerger";

in

{
  imports = [
    ../modules
  ];

  my = {
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
            path = "/Applications/Franz.app";
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

      sessionPath = [
        "$HOME/.local/bin"
      ];

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
    };

    programs = {
      alacritty = import ./programs/alacritty.nix { inherit pkgs; };
      dircolors = import ./programs/dircolors.nix { inherit pkgs; };
      direnv = import ./programs/direnv.nix { inherit pkgs; };
      fzf = import ./programs/fzf.nix { inherit pkgs; };
      go = import ./programs/go.nix { inherit pkgs; };
      lsd = import ./programs/lsd.nix { inherit pkgs; };
      neovim = import ./programs/neovim.nix { inherit pkgs; };
      octant = import ./programs/octant.nix { inherit pkgs; };
      readline = import ./programs/readline.nix { inherit pkgs; };
      ssh = import ./programs/ssh.nix { inherit pkgs; };
      starship = import ./programs/starship.nix { inherit pkgs; };
      vscode = import ./programs/vscode.nix { inherit pkgs; };
      zsh = import ./programs/zsh.nix { inherit pkgs; };
    };
  };
}
