{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    homebrew = {
      brews = [
        "svn"
      ];

      taps = [
        "homebrew/cask-fonts"
      ];

      casks = [
        "font-fira-code-nerd-font"
        "font-fontawesome"
        "font-sauce-code-pro-nerd-font"
        "font-source-code-pro"
      ];
    };
  };
}
