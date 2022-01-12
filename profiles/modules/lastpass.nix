{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.lastpass;

in

{
  options = with lib; {
    my = {
      modules = {
        lastpass = {
          enable = mkEnableOption ''
            Whether to enable lastpass module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "lastpass"
        ];
      };
    };
}
