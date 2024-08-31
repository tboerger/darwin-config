{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
      };
    };
  };
}
