{ pkgs, inputs, system, ... }:

{
  users = {
    users = {
      thomas = {
        description = "Thomas Boerger";
        isNormalUser = true;
        shell = pkgs.zsh;
        hashedPassword = "$6$yuwsoikF5utqohar$fdcvq0iXdmiioiRyBGeVZICzQm4nKlv6.pj9AWh13VRCsE07dN9StDnXV0aslIBb0SWRFC4dY5Um2MYiAMfmH0";
        openssh = {
          authorizedKeys = {
            keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINaQYR0/Oj6k1H03kshz2J7rlGCaDSuaGPhhOs9FcZfn thomas@osiris"
            ];
          };
        };
        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
          "libvirtd"
          "audio"
          "video"
        ];
      };
    };
  };

  home-manager.users.thomas = { config, ... }: {
    sessionPath = [
      "$HOME/.local/bin"
    ];

    programs = {
      alacritty = import ./programs/alacritty.nix;
      autorandr = import ./programs/autorandr.nix;
      dircolors = import ./programs/dircolors.nix;
      direnv = import ./programs/direnv.nix;
      feh = import ./programs/feh.nix;
      fzf = import ./programs/fzf.nix;
      git = import ./programs/git.nix;
      go = import ./programs/go.nix;
      gpg = import ./programs/gpg.nix;
      lsd = import ./programs/lsd.nix;
      neovim = import ./programs/neovim.nix;
      octant = import ./programs/octant.nix;
      readline = import ./programs/readline.nix;
      rofi = import ./programs/rofi.nix;
      ssh = import ./programs/ssh.nix;
      starship = import ./programs/starship.nix;
      vscode = import ./programs/vscode.nix;
      zsh = import ./programs/zsh.nix;
    };

    services = {
      betterlockscreen = import ./services/betterlockscreen.nix;
      blueman-applet = import ./services/blueman-applet.nix;
      caffeine = import ./services/caffeine.nix;
      dunst = import ./services/dunst.nix;
      flameshot = import ./services/flameshot.nix;
      gpg-agent = import ./services/gpg-agent.nix;
      network-manager-applet = import ./services/nm-applet.nix;
      owncloud-client = import ./services/owncloud-client.nix;
      polybar = import ./services/polybar.nix;
    };

    file = {
      ".local/bin/git-amend" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-amend);
      };
      ".local/bin/git-conflicts" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-conflicts);
      };
      ".local/bin/git-gh-pages" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-gh-pages);
      };
      ".local/bin/git-promote" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-promote);
      };
      ".local/bin/git-recently-checkout-branches" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-recently-checkout-branches);
      };
      ".local/bin/git-resolve" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-resolve);
      };
      ".local/bin/git-unpushed-branches" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-unpushed-branches);
      };
      ".local/bin/git-unreleased" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-unreleased);
      };
      ".local/bin/git-where" = {
        executable = true;
        text = (builtins.readFile ./scripts/git-where);
      };
      ".local/bin/search-and-replace" = {
        executable = true;
        text = (builtins.readFile ./scripts/search-and-replace);
      };

      ".local/wallpapers/dark.jpg" = {
        executable = false;
        text = (builtins.readFile ./wallpapers/dark.jpg);
      };
      ".local/wallpapers/light.jpg" = {
        executable = false;
        text = (builtins.readFile ./wallpapers/light.jpg);
      };
      ".local/wallpapers/tower.jpg" = {
        executable = false;
        text = (builtins.readFile ./wallpapers/tower.jpg);
      };
    };
  };
}
