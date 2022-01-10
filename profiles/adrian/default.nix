{ pkgs, inputs, system, lib, ... }:

let
  username = "adrian";
  fullname = "Adrian Boerger";

in

{
  imports = [
    ../modules
  ];

  my = {
    username = "${username}";

    modules = {
      git = {
        enable = false;
      };

      gpg = {
        enable = false;
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
    };
  };
}
