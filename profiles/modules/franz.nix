{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.franz;

in

{
  options = with lib; {
    my = {
      modules = {
        franz = {
          enable = mkEnableOption ''
            Whether to enable franz module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "franz"
        ];
      };
    };
}
