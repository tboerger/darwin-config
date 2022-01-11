{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.deezer;

in

{
  options = with lib; {
    my = {
      modules = {
        deezer = {
          enable = mkEnableOption ''
            Whether to enable deezer module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "deezer"
        ];
      };
    };
}
