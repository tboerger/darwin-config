{ pkgs, inputs, system, lib, ... }:

let
  username = "anna";
  fullname = "Anna Boerger";

in

{
  imports = [
    ../modules
  ];

  my = {
    username = "${username}";

    modules = {
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
    };
  };
}
