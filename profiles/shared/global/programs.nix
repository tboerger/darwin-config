{ pkgs, lib, config, options, ... }:

{
  home = {
    packages = with pkgs; [
      htop
      iftop
      neofetch
      silver-searcher
      tldr
      tree
    ];
  };
}
