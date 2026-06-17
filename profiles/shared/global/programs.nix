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
      ripgrep
      tldr
      tree
    ];
  };
}
