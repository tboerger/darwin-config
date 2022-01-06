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
    };

    programs = {
      alacritty = import ./programs/alacritty.nix { inherit pkgs; };
      dircolors = import ./programs/dircolors.nix { inherit pkgs; };
      direnv = import ./programs/direnv.nix { inherit pkgs; };
      fzf = import ./programs/fzf.nix { inherit pkgs; };
      git = import ./programs/git.nix { inherit pkgs; };
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

    # file = {
    #   ".local/bin/git-amend" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-amend);
    #   };
    #   ".local/bin/git-conflicts" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-conflicts);
    #   };
    #   ".local/bin/git-gh-pages" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-gh-pages);
    #   };
    #   ".local/bin/git-promote" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-promote);
    #   };
    #   ".local/bin/git-recently-checkout-branches" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-recently-checkout-branches);
    #   };
    #   ".local/bin/git-resolve" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-resolve);
    #   };
    #   ".local/bin/git-unpushed-branches" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-unpushed-branches);
    #   };
    #   ".local/bin/git-unreleased" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-unreleased);
    #   };
    #   ".local/bin/git-where" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/git-where);
    #   };
    #   ".local/bin/search-and-replace" = {
    #     executable = true;
    #     text = (builtins.readFile ../../scripts/search-and-replace);
    #   };

    #   ".local/wallpapers/dark.jpg" = {
    #     executable = false;
    #     text = (builtins.readFile ../../wallpapers/dark.jpg);
    #   };
    #   ".local/wallpapers/light.jpg" = {
    #     executable = false;
    #     text = (builtins.readFile ../../wallpapers/light.jpg);
    #   };
    #   ".local/wallpapers/tower.jpg" = {
    #     executable = false;
    #     text = (builtins.readFile ../../wallpapers/tower.jpg);
    #   };
    # };
  };
}
