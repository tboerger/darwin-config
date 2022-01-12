{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.rancher;

in

{
  options = with lib; {
    my = {
      modules = {
        rancher = {
          enable = mkEnableOption ''
            Whether to enable rancher module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "rancher"
        ];
      };
    };
}
