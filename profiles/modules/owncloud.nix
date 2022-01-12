{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.owncloud;

in

{
  options = with lib; {
    my = {
      modules = {
        owncloud = {
          enable = mkEnableOption ''
            Whether to enable owncloud module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "owncloud"
        ];
      };
    };
}
