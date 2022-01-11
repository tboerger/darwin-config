{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.chrome;

in

{
  options = with lib; {
    my = {
      modules = {
        chrome = {
          enable = mkEnableOption ''
            Whether to enable chrome module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "google-chrome"
        ];
      };
    };
}
