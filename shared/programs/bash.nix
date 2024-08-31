{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    programs = {
      bash = {
        enable = true;
        enableCompletion = true;
      };
    };
  };
}