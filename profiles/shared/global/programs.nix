{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  home = {
    packages = with pkgs; [
      fastfetch
      htop
      iftop
      silver-searcher
      tldr
      tree
    ];
  };
}
