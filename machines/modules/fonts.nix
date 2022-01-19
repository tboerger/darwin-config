{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.fonts;

in

{
  options = with lib; {
    my = {
      modules = {
        fonts = {
          enable = mkEnableOption ''
            Whether to enable fonts module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        brews = [
          "svn"
        ];

        taps = [
          "homebrew/cask-fonts"
        ];

        casks = [
          "font-source-code-pro"
          "font-fira-code"
          "font-fontawesome"
          "font-fira-code-nerd-font"
        ];
      };
    };
}
