{ pkgs, lib, config, options, ... }:
with lib;

{
  users = {
    users = {
      thomas = {
        description = "Thomas Boerger";
        shell = pkgs.zsh;
        home = "/Users/thomas";
      };
    };
  };
}
