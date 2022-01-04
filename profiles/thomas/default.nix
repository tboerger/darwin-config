{ pkgs, inputs, system, lib, ... }:

let
  username = "thomas";

in

{
  users = {
    users = {
      "${username}" = {
        description = "Thomas Boerger";
        shell = pkgs.zsh;

        home =
          if pkgs.stdenv.isDarwin then
            "/Users/${username}"
          else
            "/home/${username}";
      } // (lib.mkIf pkgs.stdenv.isLinux {
        isNormalUser = true;
        hashedPassword = "$6$yuwsoikF5utqohar$fdcvq0iXdmiioiRyBGeVZICzQm4nKlv6.pj9AWh13VRCsE07dN9StDnXV0aslIBb0SWRFC4dY5Um2MYiAMfmH0";

        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
          "libvirtd"
          "audio"
          "video"
        ];

        openssh = {
          authorizedKeys = {
            keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINaQYR0/Oj6k1H03kshz2J7rlGCaDSuaGPhhOs9FcZfn thomas@osiris"
            ];
          };
        };
      });
    };
  };

  home-manager.users."${username}" = { config, ... }: {
    # sessionPath = [
    #   "$HOME/.local/bin"
    # ];

    # xsession = {
    #   enable = true;
    # };

    programs = {
    #   alacritty = import ./programs/alacritty.nix { inherit pkgs; };
    #   autorandr = import ./programs/autorandr.nix { inherit pkgs; };
    #   dircolors = import ./programs/dircolors.nix { inherit pkgs; };
    #   direnv = import ./programs/direnv.nix { inherit pkgs; };
    #   feh = import ./programs/feh.nix { inherit pkgs; };
    #   fzf = import ./programs/fzf.nix { inherit pkgs; };
      git = import ./programs/git.nix { inherit pkgs; };
    #   go = import ./programs/go.nix { inherit pkgs; };
    #   gpg = import ./programs/gpg.nix { inherit pkgs; };
    #   lsd = import ./programs/lsd.nix { inherit pkgs; };
    #   neovim = import ./programs/neovim.nix { inherit pkgs; };
    #   octant = import ./programs/octant.nix { inherit pkgs; };
    #   readline = import ./programs/readline.nix { inherit pkgs; };
    #   rofi = import ./programs/rofi.nix { inherit pkgs; };
      ssh = import ./programs/ssh.nix { inherit pkgs; };
    #   starship = import ./programs/starship.nix { inherit pkgs; };
    #   vscode = import ./programs/vscode.nix { inherit pkgs; };
      zsh = import ./programs/zsh.nix { inherit pkgs; };
    };

    # services = {
    #   betterlockscreen = import ./services/betterlockscreen.nix { inherit pkgs; };
    #   blueman-applet = import ./services/blueman-applet.nix { inherit pkgs; };
    #   caffeine = import ./services/caffeine.nix { inherit pkgs; };
    #   dunst = import ./services/dunst.nix { inherit pkgs; };
    #   flameshot = import ./services/flameshot.nix { inherit pkgs; };
    #   gpg-agent = import ./services/gpg-agent.nix { inherit pkgs; };
    #   network-manager-applet = import ./services/nm-applet.nix { inherit pkgs; };
    #   owncloud-client = import ./services/owncloud-client.nix { inherit pkgs; };
    #   polybar = import ./services/polybar.nix { inherit pkgs; };
    #   udiskie = import ./services/udiskie.nix { inherit pkgs; };
    # };

    # file = {
    #   ".local/bin/git-amend" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-amend);
    #   };
    #   ".local/bin/git-conflicts" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-conflicts);
    #   };
    #   ".local/bin/git-gh-pages" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-gh-pages);
    #   };
    #   ".local/bin/git-promote" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-promote);
    #   };
    #   ".local/bin/git-recently-checkout-branches" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-recently-checkout-branches);
    #   };
    #   ".local/bin/git-resolve" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-resolve);
    #   };
    #   ".local/bin/git-unpushed-branches" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-unpushed-branches);
    #   };
    #   ".local/bin/git-unreleased" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-unreleased);
    #   };
    #   ".local/bin/git-where" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/git-where);
    #   };
    #   ".local/bin/search-and-replace" = {
    #     executable = true;
    #     text = (builtins.readFile ./scripts/search-and-replace);
    #   };

    #   ".local/wallpapers/dark.jpg" = {
    #     executable = false;
    #     text = (builtins.readFile ./wallpapers/dark.jpg);
    #   };
    #   ".local/wallpapers/light.jpg" = {
    #     executable = false;
    #     text = (builtins.readFile ./wallpapers/light.jpg);
    #   };
    #   ".local/wallpapers/tower.jpg" = {
    #     executable = false;
    #     text = (builtins.readFile ./wallpapers/tower.jpg);
    #   };
    # };
  };
}
