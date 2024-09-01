{ pkgs, lib, config, options, ... }:
with lib;

{
  users = {
    users = {
      thomas = {
        description = "Thomas Boerger";
        shell = pkgs.zsh;
        home = "/Users/thomas";
        openssh = {
          authorizedKeys = {
            keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINaQYR0/Oj6k1H03kshz2J7rlGCaDSuaGPhhOs9FcZfn Thomas Boerger"
            ];
          };
        };
      };
    };
  };
}
