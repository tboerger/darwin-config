{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.jabra;

in

{
  options = with lib; {
    my = {
      modules = {
        jabra = {
          enable = mkEnableOption ''
            Whether to enable jabra module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        taps = [
          "homebrew/cask-drivers"
        ];

        casks = [
          "jabra-direct"
        ];
      };
    };
}
