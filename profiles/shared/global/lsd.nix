{ pkgs, lib, config, options, ... }:

{
  programs = {
    lsd = {
      enable = true;
      enableAliases = true;
    };
  };
}
