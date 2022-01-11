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
        taps = [
          "homebrew/cask-fonts"
        ];

        casks = [
          "font-fira-code"
          "font-fontawesome"
          "font-roboto"
          "font-fira-code-nerd-font"
        ];
      };
    };
}
